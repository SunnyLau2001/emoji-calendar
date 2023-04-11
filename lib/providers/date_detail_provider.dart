import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/event.dart';
import '../models/multiday_event.dart';

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
Future<List<Event?>> fetchEvents(FetchEventsRef ref, {required List<int> eventIds}) async {
  final events = await MultidayEventService().getEventsByIds(eventIds);
  return events;
}

@riverpod
Future<List<MultidayEvent?>> fetchMultidayEventsDetail(FetchMultidayEventsDetailRef ref,
    {required List<int> multidayEventsIds}) async {
  final multidayEventsDetail = await MultidayEventService().getMultidayEventsByIds(multidayEventsIds);
  return multidayEventsDetail;
}
