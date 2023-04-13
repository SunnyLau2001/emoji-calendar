import 'package:fyp_our_sky_new/models/date_detail.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/providers/event_temp.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:isar/isar.dart';

import 'date_detail_provider.dart';
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
    List<String> dateStrings = [];
    List<DateDetail> dateDetails = [];

    for (int i = 0; i < step; i++) {
      final date = DateTime(startDate.year, startDate.month, startDate.day + i);
      dateStrings.add("${date.year}-${date.month}-${date.day}");
      dateDetails.add(DateDetail()
        ..date = dateStrings[i]
        ..lastUpdate = DateTime.now());
    }

    // if (result == null) {
    //   for (int i = 0; i < step; i++) {
    //     dateDetails.add(DateDetail()
    //       ..date = dateStrings[i]
    //       ..lastUpdate = DateTime.now());
    //   }
    // } else {
    //   dateDetails = [...result];
    // }

    for (int i = 0; i < step; i++) {
      if (dateDetails[i] == null) {
        final dateDetail = DateDetail()
          ..date = dateStrings[i]
          ..lastUpdate = DateTime.now();
        dateDetails[i] = dateDetail;
      }
    }

    List<MultidayEventDateListProp> tempList = [];
    for (int i = 0; i < step; i++) {
      final date = DateTime(startDate.year, startDate.month, startDate.day + i);
      MultidayEventDateListProp temp = MultidayEventDateListProp(
        dateString: "${date.year}-${date.month}-${date.day}",
        dateTime: date,
        dateDetail: dateDetails[i],
        events: [],
      );
      tempList.add(temp);
    }
    print(tempList);
    state = [...tempList];
  }

  void clearAllEventsByDateIndex(int dateIndex) {
    List<MultidayEventDateListProp> tempState = state;
    tempState[dateIndex] = tempState[dateIndex].copyWith(events: []);
    state = tempState;
  }

  void addEventByDateIndex(int dateIndex, EventTemp event) {
    print("Add");
    // List<MultidayEventDateListProp> tempState = state;
    // if (dateIndex > tempState.length - 1) continue;
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
    List<MultidayEventDateListProp> tempState = state;

    if (dateIndex > tempState.length - 1) return;
    if (eventIndex == -1 || eventIndex > tempState[dateIndex].events.length - 1) return;

    final dateListProp = tempState[dateIndex];
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
    if (tempState.isNotEmpty) {
      tempState[dateIndex] = dateListProp.copyWith(events: tempEvents);
      state = tempState;
    }
  }

  void removeEventByDateIndex(int dateIndex, EventTemp event) {
    List<MultidayEventDateListProp>? tempState = state;

    ref.watch(multidayEventDetailProvider.notifier).removeEventAndChecklist(event.id, event.checklistTemp.id);

    if (tempState == null) return;
    final dateListProp = tempState[dateIndex];
    List<EventTemp> tempList = [...dateListProp.events];
    tempList.remove(event);

    DateDetail dateDetail = dateListProp.dateDetail;
    if (event.id != Isar.autoIncrement) {
      List<int> eventIds = dateListProp.dateDetail.eventsId;
      if (eventIds.contains(event.id)) eventIds.remove(event.id);
      dateDetail.eventsId = eventIds;
    }

    tempState[dateIndex] = dateListProp.copyWith(events: tempList, dateDetail: dateDetail);
    state = tempState;
  }
}
