import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_range_selected_notifier.g.dart';

@riverpod
class DateRangeSelected extends _$DateRangeSelected {
  @override
  List<DateTime> build() {
    // Inside "build", we return the initial state of the counter.
    return [];
  }

  void clearDateRange() {
    state = [];
  }

  void initDateRange() {
    final current = DateTime.now();
    state = [DateTime(current.year, current.month, current.day)];
  }

  void toggleDate(DateTime date) {
    List<DateTime> temp = [...state];

    // if nothing selected
    if (temp.isEmpty) {
      state = [date];
      return;
    }

    if (temp.length == 1) {
      final compare = temp[0].compareTo(date);

      state = compare == -1
          ? [...state, date]
          : compare == 1
              ? [date, ...state]
              : [];
      return;
    }

    if (temp.length == 2) {
      if (date.isAtSameMomentAs(state[0])) {
        state = [state[1]];
        return;
      }
      if (date.isAtSameMomentAs(state[1])) {
        state = [state[0]];
        return;
      }
      if (date.isBefore(state[0])) {
        state = [date, state[1]];
        return;
      }
      if (date.isAfter(state[0]) && date.isBefore(state[1])) {
        final dayDiffStart = date.difference(state[0]).inDays.abs();
        final dayDiffEnd = date.difference(state[1]).inDays.abs();
        if (dayDiffStart >= dayDiffEnd) {
          state = [date, state[1]];
        } else {
          state = [state[0], date];
        }
        return;
      }
      if (date.isAfter(state[1])) {
        state = [state[0], date];
        return;
      }
      return;
    }
  }
}
