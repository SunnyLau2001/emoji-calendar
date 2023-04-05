import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';


import '../utils/calendar_settings.dart';

final isSelectingDateRangeProvider = StateProvider<bool>((ref) {
  return false;
});

// Following two providers used to provide the suitable Year and Month
// According to the offset
final rowOffsetProvider = StateProvider<double>((ref) {
  return -1;
});

final initOffsetProvider = Provider<double>((ref) {
  final initOffset = ((DateTime.now().difference(AppSettings.startDate).inDays) ~/ 7) * CalendarSettings.cellHeight;
  return initOffset;
});

final headerDateProvider = Provider<DateTime>((ref) {
  final startDate = AppSettings.startDate;
  final rowOffset = ref.watch(rowOffsetProvider);
  // Add 6 to the day such that always get the final date of the row
  final currentRowLastDate =
      DateTime(startDate.year, startDate.month, startDate.day + (((rowOffset ~/ CalendarSettings.cellHeight)) * 7) + 6);
  return rowOffset == -1 ? DateTime.now() : currentRowLastDate;
});

final showBackToCurrentProvider = Provider<bool>((ref) {
  final rowOffset = ref.watch(rowOffsetProvider);
  final initOffset = ref.watch(initOffsetProvider);
  bool show = false;
  if (rowOffset != -1 && (rowOffset - initOffset).abs() > 200) {
    show = true;
  }

  return show;
});

final showSideMenuProvider = StateProvider<bool>((ref) {
  return false;
});

final currentDateProvider = Provider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

final showMonthViewDatePickerProvider = StateProvider<bool>((ref) {
  return false;
});