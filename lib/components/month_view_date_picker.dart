import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';

import '../providers/providers.dart';

class MonthViewDatePicker extends ConsumerStatefulWidget {
  const MonthViewDatePicker({super.key});

  @override
  ConsumerState<MonthViewDatePicker> createState() => _MonthViewDatePickerState();
}

class _MonthViewDatePickerState extends ConsumerState<MonthViewDatePicker> {
  @override
  Widget build(BuildContext context) {
    final show = ref.watch(showMonthViewDatePickerProvider);
    return IgnorePointer(
      ignoring: show ? false : true,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: show ? 1 : 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              color: Colors.red,
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
