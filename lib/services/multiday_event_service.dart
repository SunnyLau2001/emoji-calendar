import 'package:fyp_our_sky_new/models/checklist.dart';
import 'package:fyp_our_sky_new/models/date_detail.dart';
import 'package:fyp_our_sky_new/models/multiday_event.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_prop.dart';
import 'package:fyp_our_sky_new/utils/util_functions.dart';
import 'package:isar/isar.dart';

import '../models/event.dart';
import '../providers/multiday_event_date_list_prop.dart';
import '../providers/multiday_event_temp.dart';
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

  Future<void> putMultidayEvents(
      MultidayEventDetailProp mEventDetailProp, List<MultidayEventDateListProp> mEventDateLists) async {
    final db = await isar;
    final mEventTemp = mEventDetailProp.multidayEventTemp;

    int availableTrack = -1;

    List<DateDetail> newDateDetails =
        mEventDateLists.map((mEventDateListProp) => mEventDateListProp.dateDetail).toList();
    List<int> dateDetailIds = [];
    for (int i = 0; i < newDateDetails.length; i++) {
      dateDetailIds.add(
        UtilFunctions.fastHash(newDateDetails[i].date),
      );
    }
    List<DateDetail?> oldDateDetails = await db.dateDetails.getAll(dateDetailIds);
    // print(oldDateDetails);
    List<DateDetail> tempDateDatils = [];
    for (int i = 0; i < newDateDetails.length; i++) {
      if (oldDateDetails[i] == null) {
        tempDateDatils.add(newDateDetails[i]);
      } else {
        DateDetail tempDateDetail = oldDateDetails[i]!;
        tempDateDetail.eventsId = <int>{...tempDateDetail.eventsId, ...newDateDetails[i].eventsId}.toList();
        for (int j = 0; j < mEventDetailProp.removedEventIds.length; j++) {
          tempDateDetail.eventsId.remove(mEventDetailProp.removedEventIds[j]);
        }
        tempDateDatils.add(tempDateDetail);
      }
      final available = tempDateDatils[i].availableTracks.indexOf(-1);
      if (available == -1) {
        availableTrack = -1;
      }
      if (available >= availableTrack) {
        availableTrack = available;
      }
    }

    final startTime = mEventTemp.startDate!;
    final endTime = mEventTemp.endDate!;
    final startDateString = "${startTime.year}-${startTime.month}-${startTime.day}";
    final endDateString = "${endTime.year}-${endTime.month}-${endTime.day}";

    int multidayEventId = 0;
    await db.writeTxn(() async {
      final multidayEvent = MultidayEvent()
        ..title = mEventTemp.title
        ..bookmarkColorInt = mEventTemp.bookmarkColorInt
        ..bookmarkStickerId = mEventTemp.bookmarkStickerId
        ..startDate = startDateString
        ..endDate = endDateString
        ..id = mEventTemp.id;
      multidayEventId = await db.multidayEvents.put(multidayEvent);
    });

    MultidayEvent? multidayEvent = await getMultidayEventById(multidayEventId);
    print(multidayEvent);

    for (int i = 0; i < mEventDateLists.length; i++) {
      List<int> eventIds = [];
      List<Event> events = [];
      for (int j = 0; j < mEventDateLists[i].events.length; j++) {
        final eventTemp = mEventDateLists[i].events[j];

        int? checklistId;
        List<ChecklistItem> checklistItems = [];
        checklistItems = eventTemp.checklistTemp.items.map((item) {
          return ChecklistItem()
            ..detail = item.detail
            ..checked = item.checked;
        }).toList();

        final checklist = Checklist()
          ..id = eventTemp.id
          ..checklist = checklistItems
          ..title = eventTemp.checklistTemp.title;

        await db.writeTxn(() async {
          checklistId = await db.checklists.put(checklist);
        });

        final event = Event()
          ..title = eventTemp.title
          ..startHourMinute = eventTemp.startHourMinute
          ..endHourMinute = eventTemp.endHourMinute
          ..stickerId = eventTemp.sticker!.id
          ..location = eventTemp.location
          ..latlng = eventTemp.latlng
          ..weather = ""
          ..weatherLastUpdate = eventTemp.weatherLastUpdate
          ..checklistId = checklistId
          ..multidayEventId = multidayEventId
          ..dateId = eventTemp.dateId;
        events.add(event);
      }

      await db.writeTxn(() async {
        eventIds = await db.events.putAll(events);
      });

      if (multidayEvent != null) {
        multidayEvent.eventsId = [...multidayEvent.eventsId, ...eventIds];
      }

      tempDateDatils[i].eventsId = [...tempDateDatils[i].eventsId, ...eventIds];
      tempDateDatils[i].multidayEventsId = [...tempDateDatils[i].multidayEventsId, multidayEventId];

      if (availableTrack != -1) {
        // Set the multidayEventId to availableTrack index
        tempDateDatils[i].availableTracks[availableTrack] = multidayEventId;
      }

      tempDateDatils[i].lastUpdate = DateTime.now();
    }

    // final multidayEvent = await db.multidayEvents.put();
    await db.writeTxn(() async {
      if (multidayEvent != null) {
        // Update multidayEvent with eventIds
        await db.multidayEvents.put(multidayEvent);
      }

      // Update all dateDetail
      await db.dateDetails.putAll(tempDateDatils);
    });

    return;
  }

  // Future<void> putMultidayEvents(MultidayEventDetailProp detail, List<MultidayEventDateListProp> dateLists) async {
  //   final db = await isar;
  //   List<DateDetail> dateDetails = [];
  //   int availableTrack = -1;

  //   for (int i = 0; i < dateLists.length; i++) {
  //     DateDetail? dateDetail = await db.dateDetails.get(UtilFunctions.fastHash(dateLists[i].dateString));

  //     if (dateDetail == null) {
  //       dateDetail = DateDetail()
  //         ..date = dateLists[i].dateString
  //         ..eventsId = []
  //         ..lastUpdate = DateTime.now();
  //     }

  //     dateDetails.add(dateDetail);
  //     final available = dateDetail.availableTracks.indexOf(-1);
  //     if (available == -1) {
  //       availableTrack = -1;
  //     }
  //     if (available >= availableTrack) {
  //       availableTrack = available;
  //     }
  //   }

  //   String startDateString = "";
  //   String endDateString = "";
  //   if (detail.dateRange.length == 1) {
  //     final date = detail.dateRange[0];
  //     final dateString = "${date.year}-${date.month}-${date.day}";
  //     startDateString = dateString;
  //     endDateString = dateString;
  //   }

  //   if (detail.dateRange.length == 2) {
  //     final startDate = detail.dateRange[0];
  //     startDateString = "${startDate.year}-${startDate.month}-${startDate.day}";
  //     final endDate = detail.dateRange[1];
  //     endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";
  //   }

  //   int multidayEventId = 0;
  //   await db.writeTxn(() async {
  //     final multidayEvent = MultidayEvent()
  //       ..title = detail.title
  //       ..bookmarkColorInt = detail.bookmarkColorInt
  //       ..bookmarkStickerId = detail.bookmarkStickerId
  //       ..startDate = startDateString
  //       ..endDate = endDateString;
  //     multidayEventId = await db.multidayEvents.put(multidayEvent);
  //   });

  //   MultidayEvent? multidayEvent = await getMultidayEventById(multidayEventId);
  //   print(multidayEvent);

  //   for (int i = 0; i < dateLists.length; i++) {
  //     List<int> eventIds = [];
  //     List<Event> events = [];
  //     for (int j = 0; j < dateLists[i].events.length; j++) {
  //       final eventTemp = dateLists[i].events[j];
  //       int? checklistId;
  //       if (eventTemp.checklistTemp != null) {
  //         List<ChecklistItem> checklistItems = [];
  //         checklistItems = eventTemp.checklistTemp!.items.map((item) {
  //           return ChecklistItem()
  //             ..detail = item.detail
  //             ..checked = item.checked;
  //         }).toList();

  //         final checklist = Checklist()
  //           ..checklist = checklistItems
  //           ..title = eventTemp.checklistTemp!.title;

  //         await db.writeTxn(() async {
  //           checklistId = await db.checklists.put(checklist);
  //         });
  //       }

  //       final event = Event()
  //         ..title = eventTemp.title
  //         ..startHourMinute = eventTemp.startHourMinute
  //         ..endHourMinute = eventTemp.endHourMinute
  //         ..stickerId = eventTemp.sticker!.id
  //         ..location = eventTemp.location
  //         ..latlng = eventTemp.latlng
  //         ..weather = ""
  //         ..checklistId = checklistId
  //         ..multidayEventId = multidayEventId
  //         ..dateId = dateLists[i].dateString;
  //       events.add(event);
  //     }

  //     await db.writeTxn(() async {
  //       eventIds = await db.events.putAll(events);
  //     });

  //     if (multidayEvent != null) {
  //       multidayEvent.eventsId = [...multidayEvent.eventsId, ...eventIds];
  //     }

  //     dateDetails[i].eventsId = [...dateDetails[i].eventsId, ...eventIds];
  //     dateDetails[i].multidayEventsId = [...dateDetails[i].multidayEventsId, multidayEventId];

  //     if (availableTrack != -1) {
  //       // Set the multidayEventId to availableTrack index
  //       dateDetails[i].availableTracks[availableTrack] = multidayEventId;
  //     }

  //     dateDetails[i].lastUpdate = DateTime.now();
  //   }

  //   await db.writeTxn(() async {
  //     if (multidayEvent != null) {
  //       // Update multidayEvent with eventIds
  //       await db.multidayEvents.put(multidayEvent);
  //     }

  //     // Update all dateDetail
  //     await db.dateDetails.putAll(dateDetails);
  //   });
  // }

  Stream<DateDetail?> watchDateDetailChange(String dateString) async* {
    final db = await isar;
    final dateDetail = db.dateDetails.watchObject(UtilFunctions.fastHash(dateString), fireImmediately: true);
    yield* dateDetail;
  }

  Stream<Event?> watchEventChange(int eventId) async* {
    final db = await isar;
    final event = db.events.watchObject(eventId, fireImmediately: true);
    yield* event;
  }

  Stream<MultidayEvent?> watchMultidayEventChange(int multidayEventId) async* {
    final db = await isar;
    final multidayEvent = db.multidayEvents.watchObject(multidayEventId, fireImmediately: true);
    yield* multidayEvent;
  }

  Future<List<DateDetail?>> getDateDetailsByDates(List<String> dateStrings) async {
    final db = await isar;
    List<int> hashedIds = dateStrings.map((dateString) => UtilFunctions.fastHash(dateString)).toList();
    final dateDetails = await db.dateDetails.getAll(hashedIds);
    return dateDetails;
  }

  Future<Event?> getEventById(int eventId) async {
    final db = await isar;
    final event = await db.events.get(eventId);
    return event;
  }

  Future<List<Event?>> getEventsByIds(List<int> eventIds) async {
    final db = await isar;
    final eventsList = await db.events.getAll(eventIds);
    return eventsList;
  }

  Future<MultidayEvent?> getMultidayEventById(int multidayEventId) async {
    final db = await isar;
    final multidayEvent = await db.multidayEvents.get(multidayEventId);
    return multidayEvent;
  }

  Future<List<MultidayEvent?>> getMultidayEventsByIds(List<int> multidayEventsIds) async {
    final db = await isar;
    final multidayEventsList = await db.multidayEvents.getAll(multidayEventsIds);
    return multidayEventsList;
  }
}
