import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/providers/checklist_temp_prop.dart';
import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:fyp_our_sky_new/services/sticker_service.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/checklist.dart';
import '../models/date_detail.dart';
import '../models/event.dart';
import '../models/multiday_event.dart';
import '../models/multiday_event_structured.dart';
import 'event_temp.dart';
import 'multiday_event_date_list_prop.dart';
import 'multiday_event_detail_prop.dart';
import 'multiday_event_temp.dart';

part 'date_detail_provider.g.dart';

@riverpod
Stream<DateDetailStructured?> dateDetailStructuredWatcher(DateDetailStructuredWatcherRef ref,
    {required String dateString}) async* {
  final watcher = MultidayEventService().watchDateDetailChange(dateString);

  await for (final dateDetail in watcher) {
    DateDetailStructured? dateDetailStructured;
    if (dateDetail != null) {
      List<Event?> events = [];
      List<MultidayEvent?> multidayEvents = [];
      final fetchedEvents = await MultidayEventService().getEventsByIds(dateDetail.eventsId);
      final fetchedMultidayEvents = await MultidayEventService().getMultidayEventsByIds(dateDetail.multidayEventsId);
      events = fetchedEvents;
      multidayEvents = fetchedMultidayEvents;
      events.sort(
        (a, b) {
          if (a == null || b == null) return 0;
          final date = dateDetail.date.split("-");

          final DateTime timeAStart = DateTime(
              int.parse(date[0]), int.parse(date[1]), int.parse(date[2]), a.startHourMinute[0], a.startHourMinute[1]);

          final DateTime timeBStart = DateTime(
              int.parse(date[0]), int.parse(date[1]), int.parse(date[2]), b.startHourMinute[0], b.startHourMinute[1]);

          int cmp = timeAStart.compareTo(timeBStart);
          if (cmp != 0) return cmp;
          final DateTime timeAEnd = DateTime(
              int.parse(date[0]), int.parse(date[1]), int.parse(date[2]), a.endHourMinute[0], a.endHourMinute[1]);
          final DateTime timeBEnd = DateTime(
              int.parse(date[0]), int.parse(date[1]), int.parse(date[2]), b.endHourMinute[0], b.endHourMinute[1]);
          return timeAEnd.compareTo(timeBEnd);
        },
      );

      dateDetailStructured =
          DateDetailStructured(dateDetail: dateDetail, events: events, multidayEvents: multidayEvents);
    }
    yield dateDetailStructured;
  }
}

@riverpod
Stream<MultidayEventStructured?> multidayEventStructuredWatcher(MultidayEventStructuredWatcherRef ref,
    {required int multidayEventId}) async* {
  final watcher = MultidayEventService().watchMultidayEventChange(multidayEventId);

  await for (final multidayEvent in watcher) {
    MultidayEventStructured? multidayEventStructured;
    if (multidayEvent != null) {
      // List<Event?> events = [];
      final fetchedEvents = await MultidayEventService().getEventsByIds(multidayEvent.eventsId);

      // List<String> dateStrings = fetchedEvents.map((e) => e == null ? "" : e.dateId).toSet().toList();
      // print(dateStrings);
      fetchedEvents.sort(
        (a, b) {
          if (a == null || b == null) {
            return 0;
          }
          final aDateSplit = a.dateId.split("-");
          final bDateSplit = b.dateId.split("-");
          final timeADate = DateTime(int.parse(aDateSplit[0]), int.parse(aDateSplit[1]), int.parse(aDateSplit[2]));
          final timeBDate = DateTime(int.parse(bDateSplit[0]), int.parse(bDateSplit[1]), int.parse(bDateSplit[2]));

          final DateTime timeAStart =
              DateTime(timeADate.year, timeADate.month, timeADate.day, a.startHourMinute[0], a.startHourMinute[1]);

          final DateTime timeBStart =
              DateTime(timeBDate.year, timeBDate.month, timeBDate.day, b.startHourMinute[0], b.startHourMinute[1]);

          int cmp = timeAStart.compareTo(timeBStart);
          if (cmp != 0) return cmp;
          final DateTime timeAEnd =
              DateTime(timeADate.year, timeADate.month, timeADate.day, a.endHourMinute[0], a.endHourMinute[1]);
          final DateTime timeBEnd =
              DateTime(timeBDate.year, timeBDate.month, timeBDate.day, b.endHourMinute[0], b.endHourMinute[1]);
          return timeAEnd.compareTo(timeBEnd);
        },
      );

      // Add preprocess data for edit!!!
      final sDate = multidayEvent.startDate.split("-");
      final eDate = multidayEvent.endDate.split("-");
      final startDate = DateTime(int.parse(sDate[0]), int.parse(sDate[1]), int.parse(sDate[2]));
      final endDate = DateTime(int.parse(eDate[0]), int.parse(eDate[1]), int.parse(eDate[2]));

      final multidayEventDetailProp = MultidayEventDetailProp(
        multidayEventTemp: MultidayEventTemp(
          id: multidayEvent.id,
          title: multidayEvent.title,
          startDate: startDate,
          endDate: endDate,
          bookmarkStickerId: multidayEvent.bookmarkStickerId,
          bookmarkColorInt: multidayEvent.bookmarkColorInt,
          eventIds: multidayEvent.eventsId,
        ),
        selectFirstDate: false,
        removedEventIds: [],
        removedChecklistIds: [],
      );

      final steps = startDate.difference(endDate).inDays.abs() + 1;

      List<List<EventTemp>> eventTemps = [];
      for (int i = 0; i < steps; i++) {
        eventTemps.add([]);
      }
      List<DateTime> dateTimes = [];
      List<String> dateStrings = [];
      for (int i = 0; i < steps; i++) {
        final dateTime = DateTime(startDate.year, startDate.month, startDate.day + i);
        final dateString = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
        dateTimes.add(dateTime);
        dateStrings.add(dateString);
        for (int j = 0; j < fetchedEvents.length; j++) {
          if (fetchedEvents[j] == null) continue;
          if (fetchedEvents[j]!.dateId == dateString) {
            Checklist? checklist;
            ChecklistTemp checklistTemp;
            if (fetchedEvents[j]!.checklistId != null) {
              checklist = await MultidayEventService().getChecklistById(fetchedEvents[j]!.checklistId!);
            }
            if (checklist == null) {
              checklistTemp = ChecklistTemp(
                id: Isar.autoIncrement,
                title: "",
                items: [],
              );
            } else {
              List<ChecklistItemTemp> checklistItemTemp = checklist.checklist
                  .map((e) => ChecklistItemTemp(
                        detail: e.detail,
                        checked: e.checked,
                      ))
                  .toList();
              checklistTemp = ChecklistTemp(
                id: checklist.id,
                title: checklist.title,
                items: checklistItemTemp,
              );
            }
            final sticker = await StickerService().getStickerById(fetchedEvents[j]!.stickerId!);
            EventTemp eventTemp = EventTemp(
                id: fetchedEvents[j]!.id,
                title: fetchedEvents[j]!.title,
                location: fetchedEvents[j]!.location,
                startHourMinute: fetchedEvents[j]!.startHourMinute,
                endHourMinute: fetchedEvents[j]!.endHourMinute,
                checklistTemp: checklistTemp,
                dateId: fetchedEvents[j]!.dateId,
                sticker: sticker);
            eventTemps[i].add(eventTemp);
            // final eventTemp = EventTemp(

            // );
            // eventTemps[i].add(value);
          }
        }
      }

      List<MultidayEventDateListProp> mEventDateListProps = [];
      for (int i = 0; i < steps; i++) {
        final dateTime = dateTimes[i];
        final dateString = dateStrings[i];
        final result = await MultidayEventService().getDateDetailByDate(dateString);
        DateDetail dateDetail;
        if (result == null) {
          dateDetail = DateDetail()
            ..date = dateString[i]
            ..lastUpdate = DateTime.now();
        } else {
          dateDetail = result;
        }
        MultidayEventDateListProp mEventDetailProp = MultidayEventDateListProp(
          dateDetail: dateDetail,
          dateString: dateString,
          dateTime: dateTime,
          events: eventTemps[i],
        );
        mEventDateListProps.add(mEventDetailProp);
      }

      multidayEventStructured = MultidayEventStructured(
        multidayEvents: multidayEvent,
        events: fetchedEvents,
        mEventDetailProp: multidayEventDetailProp,
        mEventDateListProps: mEventDateListProps,
      );
    }

    yield multidayEventStructured;
  }
}

@riverpod
Future<List<DateDetail?>> fetchDateDetails(FetchDateDetailsRef ref, {required List<String> dateStrings}) async {
  final dateDetails = await MultidayEventService().getDateDetailsByDates(dateStrings);
  return dateDetails;
}

@riverpod
Future<List<Event?>> fetchEvents(FetchEventsRef ref, {required List<int> eventIds}) async {
  final events = await MultidayEventService().getEventsByIds(eventIds);
  return events;
}

@riverpod
Stream<Event?> eventWatcher(EventWatcherRef ref, {required int eventIds}) async* {
  final watcher = MultidayEventService().watchEventChange(eventIds);
  await for (final event in watcher) {
    yield event;
  }
}

@riverpod
Stream<Checklist?> checklistWatcher(ChecklistWatcherRef ref, {required int checklistId}) async* {
  final watcher = MultidayEventService().watchChecklistChange(checklistId);
  await for (final checklist in watcher) {
    yield checklist;
  }
}

@riverpod
Future<List<MultidayEvent?>> fetchMultidayEventsDetail(FetchMultidayEventsDetailRef ref,
    {required List<int> multidayEventsIds}) async {
  final multidayEventsDetail = await MultidayEventService().getMultidayEventsByIds(multidayEventsIds);
  return multidayEventsDetail;
}
