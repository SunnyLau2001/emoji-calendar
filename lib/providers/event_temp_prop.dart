import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/checklist.dart';
import '../models/sticker.dart';
import 'checklist_temp_prop.dart';

part 'event_temp_prop.freezed.dart';

@freezed
class EventTemp with _$EventTemp {
  factory EventTemp({
    required String title,
    required List<int> startHourMinute,
    required List<int> endHourMinute,
    String? location,
    List<double>? latlng,
    String? weather,
    Sticker? sticker,
    required ChecklistTemp checklistTemp,
  }) = _EventTemp;
}
