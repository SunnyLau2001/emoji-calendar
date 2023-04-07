import 'package:flutter/material.dart';

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
}
