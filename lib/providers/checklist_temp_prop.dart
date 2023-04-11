import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_temp_prop.freezed.dart';

@freezed
class ChecklistTemp with _$ChecklistTemp {
  factory ChecklistTemp({
    required String title,
    required List<ChecklistItemTemp> items,
  }) = _ChecklistTemp;
}

@freezed
class ChecklistItemTemp with _$ChecklistItemTemp {
  factory ChecklistItemTemp({
    required String detail,
    required bool checked,
  }) = _ChecklistItemTemp;
}
