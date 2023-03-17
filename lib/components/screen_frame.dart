import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/custom_float_button.dart';
import 'package:fyp_our_sky_new/components/month_view.dart';
import 'package:fyp_our_sky_new/components/top_bar.dart';

import '../providers/providers.dart';
import '../utils/app_settings.dart';
import '../utils/calendar_settings.dart';
import 'custom_overlay.dart';
import 'custom_side_menu.dart';

class ScreenFrame extends ConsumerStatefulWidget {
  const ScreenFrame({super.key});

  @override
  ConsumerState<ScreenFrame> createState() => _ScreenFrameState();
}

class _ScreenFrameState extends ConsumerState<ScreenFrame> {
  late DateTime calendarStartDate;
  late DateTime calendarEndDate;
  late DateTime currentDate;
  late int currentRowIndex;

  late ScrollController monthViewController;

  // Cell height will affect the initial offset of the ListView
  final double cellHeight = CalendarSettings.cellHeight;

  void initCurrentDate() {
    final current = DateTime.now();
    currentDate = DateTime(current.year, current.month, current.day);
  }

  void initCurrentRowIndex() {
    currentRowIndex = (currentDate.difference(calendarStartDate).inDays / 7).floor();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarStartDate = AppSettings.startDate;
    calendarEndDate = AppSettings.calendarEndDate;

    // initCalendarStartAndEndDate(DateTime(2022, 1, 1), DateTime(2030, 12, 31));
    initCurrentDate();
    initCurrentRowIndex();
    monthViewController = ScrollController(initialScrollOffset: currentRowIndex * cellHeight)
      ..addListener(() {
        ref.read(rowOffsetProvider.notifier).state = monthViewController.offset;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    monthViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/background/background-sky.jpg",
              fit: BoxFit.fitHeight,
              alignment: Alignment(0.4, 1),
            ),
          ),
          CustomOverlay(),
          TopBar(height: 120),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width,
              child: MonthView(
                monthViewController: monthViewController,
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 14,
            child: CustomFloatButton(
              monthViewController: monthViewController,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final showSideMenu = ref.watch(showSideMenuProvider);
              return AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: showSideMenu ? 0 : -(MediaQuery.of(context).size.width - 100),
                child: CustomSideMenu(),
              );
            },
          )
        ],
      ),
    );
  }
}
