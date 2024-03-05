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

    final startTime = mEventTemp.startDate!;
    final endTime = mEventTemp.endDate!;
    final startDateString = "${startTime.year}-${startTime.month}-${startTime.day}";
    final endDateString = "${endTime.year}-${endTime.month}-${endTime.day}";

    Id multidayEventId = mEventTemp.id == Isar.autoIncrement || mEventTemp.id == 0 ? Isar.autoIncrement : mEventTemp.id;
    MultidayEvent? multidayEvent;

    bool existingTrack = false;

    if (multidayEventId == Isar.autoIncrement || mEventTemp.id == 0) {
      await db.writeTxn(() async {
        final newMultidayEvent = MultidayEvent()
          ..id = mEventTemp.id
          ..title = mEventTemp.title
          ..bookmarkColorInt = mEventTemp.bookmarkColorInt
          ..bookmarkStickerId = mEventTemp.bookmarkStickerId
          ..startDate = startDateString
          ..endDate = endDateString;
        multidayEventId = await db.multidayEvents.put(newMultidayEvent);
      });
      multidayEvent = await getMultidayEventById(multidayEventId);
    } else {
      multidayEvent = MultidayEvent()
        ..id = mEventTemp.id
        ..title = mEventTemp.title
        ..bookmarkColorInt = mEventTemp.bookmarkColorInt
        ..bookmarkStickerId = mEventTemp.bookmarkStickerId
        ..startDate = startDateString
        ..endDate = endDateString
        ..eventsId = mEventTemp.eventIds;
    }

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
      if (tempDateDatils[i].availableTracks.contains(multidayEventId)) {
        existingTrack = true;
      }

      final available = tempDateDatils[i].availableTracks.indexOf(-1);
      if (available == -1) {
        availableTrack = -1;
      }
      if (available >= availableTrack) {
        availableTrack = available;
      }
    }

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
          ..id = eventTemp.id
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
        multidayEvent.eventsId = {...multidayEvent.eventsId, ...eventIds}.toList();
      }

      tempDateDatils[i].eventsId = {...tempDateDatils[i].eventsId, ...eventIds}.toList();
      tempDateDatils[i].multidayEventsId = {...tempDateDatils[i].multidayEventsId, multidayEventId}.toList();

      if (availableTrack != -1 && !existingTrack) {
        // print(existingTrack);
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

      await db.events.deleteAll(mEventDetailProp.removedEventIds);
      await db.checklists.deleteAll(mEventDetailProp.removedEventIds);
    });

    return;
  }

  Future<void> putChecklistToDB(Checklist checklist, int eventId) async {
    final db = await isar;
    // int eventId
    await db.writeTxn(() async {
      await db.checklists.put(checklist);
    });

    final event = await db.events.get(eventId);
    if (event == null) return;

    final multidayEvent = await db.multidayEvents.get(event.multidayEventId);
    if (multidayEvent == null) return;

    await db.writeTxn(() async {
      await db.multidayEvents.put(multidayEvent);
    });

    return;
  }

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

  Stream<Checklist?> watchChecklistChange(int checklistId) async* {
    final db = await isar;
    final checklist = db.checklists.watchObject(checklistId, fireImmediately: true);
    yield* checklist;
  }

  Future<DateDetail?> getDateDetailByDate(String dateString) async {
    final db = await isar;
    final dateDetail = await db.dateDetails.get(UtilFunctions.fastHash(dateString));
    return dateDetail;
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

  Future<Checklist?> getChecklistById(int checklistId) async {
    final db = await isar;
    final checklist = await db.checklists.get(checklistId);
    return checklist;
  }

  Future<void> initDatabase() async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.dateDetails.clear();
      await db.multidayEvents.clear();
      await db.events.clear();
      await db.checklists.clear();
    });
  }
}
