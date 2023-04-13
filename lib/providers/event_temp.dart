import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../models/sticker.dart';
import 'checklist_temp_prop.dart';

part 'event_temp.freezed.dart';

@freezed
class EventTemp with _$EventTemp {
  factory EventTemp({
    required Id id,
    required String title,
    required List<int> startHourMinute,
    required List<int> endHourMinute,
    Sticker? sticker,
    String? location,
    List<double>? latlng,
    String? weather,
    double? temperature,
    DateTime? weatherLastUpdate,

    required ChecklistTemp checklistTemp,
    int? multidayEventId,
    required String dateId,
  }) = _EventTemp;
}
