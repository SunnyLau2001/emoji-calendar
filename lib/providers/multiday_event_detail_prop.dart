import 'package:freezed_annotation/freezed_annotation.dart';

import 'multiday_event_temp.dart';

part 'multiday_event_detail_prop.freezed.dart';

@freezed
class MultidayEventDetailProp with _$MultidayEventDetailProp {
  factory MultidayEventDetailProp({
    required MultidayEventTemp multidayEventTemp,
    required bool selectFirstDate,
    required List<int> removedEventIds,
    required List<int> removedChecklistIds,
  }) = _MultidayEventDetailProp;
}
