import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';

import '../utils/calendar_settings.dart';

final isSelectingProvider = StateProvider<bool>((ref) {
  return false;
});

// Following two providers used to provide the suitable Year and Month
// According to the offset
final rowOffsetProvider = StateProvider<double>((ref) {
  return -1;
});

final headerDateProvider = Provider<DateTime>((ref) {
  final startDate = AppSettings.startDate;
  final rowOffset = ref.watch(rowOffsetProvider);
  // Add 6 to the day such that always get the final date of the row
  final currentRowLastDate =
      DateTime(startDate.year, startDate.month, startDate.day + (((rowOffset ~/ CalendarSettings.cellHeight)) * 7) + 6);
  // final monthOffset = pageOffset > pageOffset.truncate() + 0.5
  //     ? (rowOffset + startDate.month).ceil()
  //     : (rowOffset + startDate.month).floor();
  return rowOffset == -1 ? DateTime.now() : currentRowLastDate;
});
