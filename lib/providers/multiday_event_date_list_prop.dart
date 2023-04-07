import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/event.dart';

part 'multiday_event_date_list_prop.freezed.dart';

@freezed
class MultidayEventDateListProp with _$MultidayEventDateListProp {
  factory MultidayEventDateListProp({
    required String dateString,
    required DateTime dateTime,
    required List<Event> events,
  }) = _MultidayEventDateListProp;
}
