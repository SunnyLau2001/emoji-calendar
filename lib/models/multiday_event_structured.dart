import 'package:freezed_annotation/freezed_annotation.dart';

import 'event.dart';
import 'multiday_event.dart';

part 'multiday_event_structured.freezed.dart';

@freezed
class MultidayEventStructured with _$MultidayEventStructured {
  factory MultidayEventStructured({
    required MultidayEvent? multidayEvents,
    required List<Event?> events,
    // required List<ChecklistItemTemp> items,
  }) = _MultidayEventStructured;
}
