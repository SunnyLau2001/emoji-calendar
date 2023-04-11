import 'package:freezed_annotation/freezed_annotation.dart';

import 'date_detail.dart';
import 'event.dart';
import 'multiday_event.dart';

part 'date_detail_structured.freezed.dart';

@freezed
class DateDetailStructured with _$DateDetailStructured {
  factory DateDetailStructured({
    required DateDetail? dateDetail,
    required List<Event?> events,
    required List<MultidayEvent?> multidayEvents,
    // required List<ChecklistItemTemp> items,
  }) = _DateDetailStructured;
}
