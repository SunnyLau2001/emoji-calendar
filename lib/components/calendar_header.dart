import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

class CalendarHeader extends ConsumerWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headerDate = ref.watch(headerDateProvider);
    // Divide by the height of cell/row
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            headerDate.year.toString(),
            style: FontSettings.primaryFont.copyWith(fontSize: 20),
          ),
          Text(
            CustomDateString.monthsLong[headerDate.month - 1],
            style: FontSettings.primaryFont.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
