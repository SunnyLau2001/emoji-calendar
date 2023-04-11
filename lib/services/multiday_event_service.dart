import 'package:fyp_our_sky_new/models/checklist.dart';
import 'package:fyp_our_sky_new/models/date_detail.dart';
import 'package:fyp_our_sky_new/models/multiday_event.dart';
import 'package:fyp_our_sky_new/utils/util_functions.dart';
import 'package:isar/isar.dart';

import '../models/event.dart';
import '../providers/multiday_event_date_list_prop.dart';
import '../providers/multiday_event_detail_prop.dart';
import 'isar_service.dart';

class MultidayEventService {
  late Future<Isar> isar;

  MultidayEventService() {
    isar = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      await IsarService.initIsar();
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> putMultidayEvents(MultidayEventDetailProp detail, List<MultidayEventDateListProp> dateLists) async {
    final db = await isar;
    List<DateDetail> dateDetails = [];
    int availableTrack = -1;

    for (int i = 0; i < dateLists.length; i++) {
      DateDetail? dateDetail = await db.dateDetails.get(UtilFunctions.fastHash(dateLists[i].dateString));

      if (dateDetail == null) {
        dateDetail = DateDetail()
          ..date = dateLists[i].dateString
          ..eventsId = []
          ..lastUpdate = DateTime.now();
      }

      dateDetails.add(dateDetail);
      final available = dateDetail.availableTracks.indexOf(-1);
      if (available == -1) {
        availableTrack = -1;
      }
      if (available >= availableTrack) {
        availableTrack = available;
      }
    }

    String startDateString = "";
    String endDateString = "";
    if (detail.dateRange.length == 1) {
      final date = detail.dateRange[0];
      final dateString = "${date.year}-${date.month}-${date.day}";
      startDateString = dateString;
      endDateString = dateString;
    }

    if (detail.dateRange.length == 2) {
      final startDate = detail.dateRange[0];
      startDateString = "${startDate.year}-${startDate.month}-${startDate.day}";
      final endDate = detail.dateRange[1];
      endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";
    }

    int multidayEventId = 0;
    await db.writeTxn(() async {
      final multidayEvent = MultidayEvent()
        ..title = detail.title
        ..bookmarkColorInt = detail.bookmarkColorInt
        ..bookmarkStickerId = detail.bookmarkStickerId
        ..startDate = startDateString
        ..endDate = endDateString;
      multidayEventId = await db.multidayEvents.put(multidayEvent);
    });

    for (int i = 0; i < dateLists.length; i++) {
      List<int> eventIds = [];
      List<Event> events = [];
      for (int j = 0; j < dateLists[i].events.length; j++) {
        final eventTemp = dateLists[i].events[j];
        int? checklistId;
        if (eventTemp.checklistTemp != null) {
          List<ChecklistItem> checklistItems = [];
          checklistItems = eventTemp.checklistTemp!.items.map((item) {
            return ChecklistItem()
              ..detail = item.detail
              ..checked = item.checked;
          }).toList();

          final checklist = Checklist()
            ..checklist = checklistItems
            ..title = eventTemp.checklistTemp!.title;

          await db.writeTxn(() async {
            checklistId = await db.checklists.put(checklist);
          });
        }

        final event = Event()
          ..title = eventTemp.title
          ..startHourMinute = eventTemp.startHourMinute
          ..endHourMinute = eventTemp.endHourMinute
          ..stickerId = eventTemp.sticker!.id
          ..location = eventTemp.location
          ..latlng = eventTemp.latlng
          ..checklistId = checklistId
          ..multidayEventId = multidayEventId
          ..dateId = dateLists[i].dateString;
        events.add(event);
      }

      await db.writeTxn(() async {
        eventIds = await db.events.putAll(events);
      });

      dateDetails[i].eventsId = [...dateDetails[i].eventsId, ...eventIds];
      dateDetails[i].multidayEventsId = [...dateDetails[i].multidayEventsId, multidayEventId];

      if (availableTrack != -1) {
        // Set the multidayEventId to availableTrack index
        dateDetails[i].availableTracks[availableTrack] = multidayEventId;
      }

      dateDetails[i].lastUpdate = DateTime.now();
    }

    // Update all dateDetail
    await db.writeTxn(() async {
      await db.dateDetails.putAll(dateDetails);
    });
  }

  Stream<DateDetail?> watchDateDetailChange(String dateString) async* {
    final db = await isar;
    final dateDetail = db.dateDetails.watchObject(UtilFunctions.fastHash(dateString), fireImmediately: true);
    yield* dateDetail;
  }

  Future<List<Event?>> getEventsByIds(List<int> eventIds) async {
    final db = await isar;
    final eventsList = await db.events.getAll(eventIds);
    return eventsList;
  }

  Future<List<MultidayEvent?>> getMultidayEventsByIds(List<int> multidayEventsIds) async {
    final db = await isar;
    final multidayEventsList = await db.multidayEvents.getAll(multidayEventsIds);
    return multidayEventsList;
  }
}
