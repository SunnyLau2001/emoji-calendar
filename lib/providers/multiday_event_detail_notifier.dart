import 'package:flutter/material.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:isar/isar.dart';

import '../models/multiday_event.dart';
import 'multiday_event_detail_prop.dart';
import 'multiday_event_temp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'multiday_event_detail_notifier.g.dart';

@riverpod
class MultidayEventDetail extends _$MultidayEventDetail {
  @override
  MultidayEventDetailProp build() {
    return MultidayEventDetailProp(
      multidayEventTemp: MultidayEventTemp(
        id: Isar.autoIncrement,
        title: '',
        startDate: null,
        endDate: null,
        bookmarkStickerId: 'default_1',
        bookmarkColorInt: Colors.blue.value,
        eventIds: [],
      ),
      selectFirstDate: false,
      removedEventIds: [],
      removedChecklistIds: [],
    );
  }

  void initMultidayEventDetailProp() {
    state = MultidayEventDetailProp(
      multidayEventTemp: MultidayEventTemp(
        id: Isar.autoIncrement,
        title: '',
        startDate: null,
        endDate: null,
        bookmarkStickerId: 'default_1',
        bookmarkColorInt: Colors.blue.value,
        eventIds: [],
      ),
      selectFirstDate: false,
      removedEventIds: [],
      removedChecklistIds: [],
    );
  }

  void updateMultidayEventDetail(MultidayEvent multidayEvent) {
    final sDate = multidayEvent.startDate.split('-');
    final eDate = multidayEvent.endDate.split('-');
    final startDateTime = DateTime(int.parse(sDate[0]), int.parse(sDate[1]), int.parse(sDate[2]));
    final endDateTime = DateTime(int.parse(eDate[0]), int.parse(eDate[1]), int.parse(eDate[2]));

    final tempState = state;
    final mEventTemp = MultidayEventTemp(
      id: multidayEvent.id,
      title: multidayEvent.title,
      startDate: startDateTime,
      endDate: endDateTime,
      bookmarkColorInt: multidayEvent.bookmarkColorInt,
      bookmarkStickerId: multidayEvent.bookmarkStickerId,
      eventIds: multidayEvent.eventsId,
    );

    state = tempState.copyWith(
      multidayEventTemp: mEventTemp,
      removedEventIds: [],
      removedChecklistIds: [],
    );
  }

  void clearDateRange() {
    final tempState = state;

    state = tempState.copyWith(
      multidayEventTemp: tempState.multidayEventTemp.copyWith(startDate: null, endDate: null),
    );
  }

  void initStartEndDate() {
    final current = DateTime.now();
    final date = DateTime(current.year, current.month, current.day);
    final tempState = state;
    state = tempState.copyWith(
      multidayEventTemp: tempState.multidayEventTemp.copyWith(startDate: date, endDate: date),
      selectFirstDate: false,
    );
  }

  void clearTitle() {
    final tempState = state;
    state = tempState.copyWith(multidayEventTemp: tempState.multidayEventTemp.copyWith(title: ''));
  }

  void setTitle(String title) {
    final tempState = state;
    state = tempState.copyWith(multidayEventTemp: tempState.multidayEventTemp.copyWith(title: title));
  }

  void clearBookmarkStickerColor() {
    final tempState = state;
    state = tempState.copyWith(
        multidayEventTemp: tempState.multidayEventTemp.copyWith(bookmarkColorInt: Colors.blue.value));
  }

  void setBookmarkStickerColor(int colorInt) {
    final tempState = state;
    state = tempState.copyWith(multidayEventTemp: tempState.multidayEventTemp.copyWith(bookmarkColorInt: colorInt));
  }

  void clearBookmarkStickerId() {
    final tempState = state;
    state = tempState.copyWith(multidayEventTemp: tempState.multidayEventTemp.copyWith(bookmarkStickerId: 'default_1'));
  }

  void setBookmarkStickerId(String id) {
    final tempState = state;
    state = tempState.copyWith(multidayEventTemp: tempState.multidayEventTemp.copyWith(bookmarkStickerId: id));
  }

  void toggleDate(DateTime date) {
    final tempState = state;
    final selectFirstDate = tempState.selectFirstDate;
    if (tempState.multidayEventTemp.startDate == null) {
      initStartEndDate();
      return;
    }

    if (selectFirstDate) {
      final mEventTemp = tempState.multidayEventTemp.copyWith(startDate: date, endDate: date);
      state = tempState.copyWith(
        multidayEventTemp: mEventTemp,
        selectFirstDate: false,
      );
    }

    if (!selectFirstDate) {
      DateTime startDate = tempState.multidayEventTemp.startDate!;
      DateTime endDate = date;
      if (startDate.isAfter(endDate)) {
        DateTime tempDate = startDate;
        startDate = endDate;
        endDate = tempDate;
      }

      final mEventTemp = tempState.multidayEventTemp.copyWith(startDate: startDate, endDate: endDate);
      state = tempState.copyWith(
        multidayEventTemp: mEventTemp,
        selectFirstDate: true,
      );
    }
  }

  void setDateList() {
    // final dateRange = state.dateRange;
    int step = 0;
    print("1");
    if (state.multidayEventTemp.startDate == null || state.multidayEventTemp.endDate == null) return;
    print("2");

    if (state.multidayEventTemp.startDate == state.multidayEventTemp.endDate) {
      step = 1;
    } else {
      step = state.multidayEventTemp.startDate!.difference(state.multidayEventTemp.endDate!).inDays.abs() + 1;
    }
    print("3 ${step}");

    ref
        .watch(multidayEventDateListProvider.notifier)
        .setMultidayEventDateList(state.multidayEventTemp.startDate!, step);
  }

  void removeEventAndChecklist(int eventId, int checklistId) {
    List<int> eventIds = state.multidayEventTemp.eventIds;

    List<int> removedEventIds = state.removedEventIds;
    List<int> removedChecklistIds = state.removedChecklistIds;
    if (eventIds.contains(eventId)) {
      eventIds.remove(eventId);
      removedEventIds.add(eventId);
    }
    if (checklistId != Isar.autoIncrement) {
      removedChecklistIds.add(checklistId);
    }

    final tempState = state;
    final mEventTemp = tempState.multidayEventTemp.copyWith(eventIds: eventIds);
    state = tempState.copyWith(
        multidayEventTemp: mEventTemp, removedEventIds: removedEventIds, removedChecklistIds: removedChecklistIds);
  }

  void removeChecklist(int checklistId) {
    if (checklistId == Isar.autoIncrement) return;

    List<int> removedChecklistIds = state.removedChecklistIds;
    removedChecklistIds.add(checklistId);
    final tempState = state;
    state = tempState.copyWith(removedChecklistIds: removedChecklistIds);
    // if (tempState.removedChecklistIds.con)
  }

  void putMultidayEventToDB() async {
    final result = ref.watch(multidayEventDateListProvider);
    final mEventDateLists = [...result];
    if (mEventDateLists == null) return;
    final mEventDetailProp = state;

    await MultidayEventService().putMultidayEvents(mEventDetailProp, mEventDateLists);

    // ref.watch(multidayEventDateListProvider.notifier).initMultidayEventDateList();
    // initMultidayEventDetailProp;

    // print(mEventDetailProps);
  }
}
