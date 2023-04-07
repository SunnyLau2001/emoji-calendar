import 'package:flutter/material.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';

import 'multiday_event_detail_prop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'multiday_event_detail_notifier.g.dart';

@riverpod
class MultidayEventDetail extends _$MultidayEventDetail {
  @override
  MultidayEventDetailProp build() {
    return MultidayEventDetailProp(
      title: '',
      dateRange: [],
      bookmarkStickerId: 'default_1',
      bookmarkColorInt: Colors.blue.value,
    );
  }

  void clearDateRange() {
    state = state.copyWith(dateRange: []);
  }

  void initDateRange() {
    if (state.dateRange.isEmpty) {
      final current = DateTime.now();
      state = state.copyWith(dateRange: [DateTime(current.year, current.month, current.day)]);
    }
  }

  void clearTitle() {
    state = state.copyWith(title: '');
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void clearBookmarkStickerColor() {
    state = state.copyWith(bookmarkColorInt: Colors.blue.value);
  }

  void setBookmarkStickerColor(int colorInt) {
    state = state.copyWith(bookmarkColorInt: colorInt);
  }

  void clearBookmarkStickerId() {
    state = state.copyWith(bookmarkStickerId: 'default_1');
  }

  void setBookmarkStickerId(String id) {
    state = state.copyWith(bookmarkStickerId: id);
  }

  void toggleDate(DateTime date) {
    List<DateTime> temp = [...state.dateRange];

    // if nothing selected
    if (temp.isEmpty) {
      state = state.copyWith(dateRange: [date]);
      return;
    }

    if (temp.length == 1) {
      final compare = temp[0].compareTo(date);

      state = compare == -1
          ? state.copyWith(dateRange: [...state.dateRange, date])
          : compare == 1
              ? state.copyWith(dateRange: [date, ...state.dateRange])
              : state.copyWith(dateRange: []);
      return;
    }

    if (temp.length == 2) {
      if (date.isAtSameMomentAs(state.dateRange[0])) {
        state = state.copyWith(dateRange: [state.dateRange[1]]);
        return;
      }
      if (date.isAtSameMomentAs(state.dateRange[1])) {
        state = state.copyWith(dateRange: [state.dateRange[0]]);

        return;
      }
      if (date.isBefore(state.dateRange[0])) {
        state = state.copyWith(dateRange: [date, state.dateRange[1]]);
        return;
      }
      if (date.isAfter(state.dateRange[0]) && date.isBefore(state.dateRange[1])) {
        final dayDiffStart = date.difference(state.dateRange[0]).inDays.abs();
        final dayDiffEnd = date.difference(state.dateRange[1]).inDays.abs();
        if (dayDiffStart >= dayDiffEnd) {
          state = state.copyWith(dateRange: [date, state.dateRange[1]]);
        } else {
          state = state.copyWith(dateRange: [state.dateRange[0], date]);
        }
        return;
      }
      if (date.isAfter(state.dateRange[1])) {
        state = state.copyWith(dateRange: [state.dateRange[0], date]);
        return;
      }
      return;
    }
  }

  void setDateList() {
    final dateRange = state.dateRange;
    int step = 0;
    if (dateRange.length == 1) {
      step = 1;
    }
    if (dateRange.length == 2) {
      step = dateRange[0].difference(dateRange[1]).inDays.abs() + 1;
    }
    ref.watch(multidayEventDateListProvider.notifier).setMultidayEventDateList(dateRange[0], step);
  }
}
