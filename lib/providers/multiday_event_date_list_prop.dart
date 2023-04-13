import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/date_detail.dart';
import 'event_temp.dart';

part 'multiday_event_date_list_prop.freezed.dart';

@freezed
class MultidayEventDateListProp with _$MultidayEventDateListProp {
  factory MultidayEventDateListProp({
    required String dateString,
    required DateTime dateTime,
    required DateDetail dateDetail,
    required List<EventTemp> events,
  }) = _MultidayEventDateListProp;
}
