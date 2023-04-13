import 'package:freezed_annotation/freezed_annotation.dart';

import '../providers/multiday_event_date_list_prop.dart';
import '../providers/multiday_event_detail_prop.dart';
import 'event.dart';
import 'multiday_event.dart';

part 'multiday_event_structured.freezed.dart';

@freezed
class MultidayEventStructured with _$MultidayEventStructured {
  factory MultidayEventStructured({
    required MultidayEvent? multidayEvents,
    required List<Event?> events,
    required MultidayEventDetailProp mEventDetailProp,
    required List<MultidayEventDateListProp> mEventDateListProps,

    // required List<ChecklistItemTemp> items,
  }) = _MultidayEventStructured;
}
