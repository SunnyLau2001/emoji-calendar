import 'package:freezed_annotation/freezed_annotation.dart';

part 'multiday_event_detail_prop.freezed.dart';

@freezed
class MultidayEventDetailProp with _$MultidayEventDetailProp {
  factory MultidayEventDetailProp({
    required String title,
    required List<DateTime> dateRange,
    required String bookmarkStickerId,
    required int bookmarkColorInt,
  }) = _MultidayEventDetailProp;
}
