import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'multiday_event_temp.freezed.dart';

@freezed
class MultidayEventTemp with _$MultidayEventTemp {
  factory MultidayEventTemp({
    required Id id,
    required String title,
    required DateTime? startDate,
    required DateTime? endDate,
    required String bookmarkStickerId,
    required int bookmarkColorInt,
    required List<int> eventIds,
  }) = _MultidayEventTemp;
}
