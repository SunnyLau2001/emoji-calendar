import 'package:fyp_our_sky_new/providers/event_temp_prop.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/services/multiday_event_service.dart';

import 'multiday_event_date_list_prop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'multiday_event_date_list_notifier.g.dart';

@riverpod
class MultidayEventDateList extends _$MultidayEventDateList {
  @override
  List<MultidayEventDateListProp> build() {
    return [];
  }

  void initMultidayEventDateList() {
    state = [];
  }

  void setMultidayEventDateList(DateTime startDate, int step) {
    List<MultidayEventDateListProp> tempList = [];
    for (int i = 0; i < step; i++) {
      final date = DateTime(startDate.year, startDate.month, startDate.day + i);
      MultidayEventDateListProp temp = MultidayEventDateListProp(
        dateString: "${date.year}-${date.month}-${date.day}",
        dateTime: date,
        events: [],
      );
      tempList.add(temp);
    }
    state = [...tempList];
  }

  void clearAllEventsByDateIndex(int dateIndex) {
    state[dateIndex] = state[dateIndex].copyWith(events: []);
    state = [...state];
  }

  void addEventByDateIndex(int dateIndex, EventTemp event) {
    if (dateIndex > state.length - 1) return;
    final dateListProp = state[dateIndex];
    final date = dateListProp.dateTime;

    final tempEvents = [...dateListProp.events];
    tempEvents.add(event);
    tempEvents.sort(
      (a, b) {
        final DateTime timeA = DateTime(date.year, date.month, date.day, a.startHourMinute[0], a.startHourMinute[1]);
        final DateTime timeB = DateTime(date.year, date.month, date.day, b.startHourMinute[0], b.startHourMinute[1]);
        return timeA.compareTo(timeB);
      },
    );
    if (state.isNotEmpty) {
      state[dateIndex] = dateListProp.copyWith(events: tempEvents);
      state = [...state];
    }
  }

  void updateEventByDateIndexAndItemIndex(int dateIndex, int eventIndex, EventTemp eventTemp) {
    if (dateIndex > state.length - 1) return;
    if (eventIndex == -1 || eventIndex > state[dateIndex].events.length - 1) return;

    final dateListProp = state[dateIndex];
    final tempEvents = [...dateListProp.events];
    final date = dateListProp.dateTime;

    tempEvents[eventIndex] = eventTemp;
    tempEvents.sort(
      (a, b) {
        final DateTime timeA = DateTime(date.year, date.month, date.day, a.startHourMinute[0], a.startHourMinute[1]);
        final DateTime timeB = DateTime(date.year, date.month, date.day, b.startHourMinute[0], b.startHourMinute[1]);
        return timeA.compareTo(timeB);
      },
    );
    if (state.isNotEmpty) {
      state[dateIndex] = dateListProp.copyWith(events: tempEvents);
      state = [...state];
    }
  }

  void removeEventByDateIndex(int dateIndex, EventTemp event) {
    final dateListProp = state[dateIndex];
    List<EventTemp> tempList = [...state[dateIndex].events];
    tempList.remove(event);
    state[dateIndex] = dateListProp.copyWith(events: tempList);
    state = [...state];
  }

  void putMultidayEvents() async {
    final multidayEventDetail = ref.watch(multidayEventDetailProvider);
    final multidayEventDateListProps = [...state];

    await MultidayEventService().putMultidayEvents(multidayEventDetail, multidayEventDateListProps);
    // print(multidayEventDetail);
    // state = [];
    // ref.watch(multidayEventDetailProvider.notifier).initializeState();
  }
}
