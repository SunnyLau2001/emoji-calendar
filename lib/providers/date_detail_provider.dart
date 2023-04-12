import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/event.dart';
import '../models/multiday_event.dart';
import '../models/multiday_event_structured.dart';

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

      fetchedEvents.sort(
        (a, b) {
          if (a == null || b == null) {
            return 0;
          }
          final aDateSplit = a.dateId.split("-");
          final bDateSplit = b.dateId.split("-");
          final timeADate = DateTime(int.parse(aDateSplit[0]), int.parse(aDateSplit[1]), int.parse(aDateSplit[2]));
          final timeBDate = DateTime(int.parse(bDateSplit[0]), int.parse(bDateSplit[1]), int.parse(bDateSplit[2]));

          // final timeADate = DateTime()
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

      multidayEventStructured = MultidayEventStructured(multidayEvents: multidayEvent, events: fetchedEvents);
    }

    yield multidayEventStructured;
  }
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
Future<List<MultidayEvent?>> fetchMultidayEventsDetail(FetchMultidayEventsDetailRef ref,
    {required List<int> multidayEventsIds}) async {
  final multidayEventsDetail = await MultidayEventService().getMultidayEventsByIds(multidayEventsIds);
  return multidayEventsDetail;
}
