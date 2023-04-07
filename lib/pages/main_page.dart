import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/custom_float_button.dart';
import 'package:fyp_our_sky_new/components/month_view.dart';
import 'package:fyp_our_sky_new/components/top_bar.dart';

import '../providers/providers.dart';
import '../utils/app_settings.dart';
import '../utils/calendar_settings.dart';
import '../components/custom_overlay.dart';
import '../components/custom_side_menu.dart';
import '../components/month_view_date_picker.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
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
      resizeToAvoidBottomInset: false,
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
          // Overlay when select date range for multiday event
          CustomOverlay(),

          SafeArea(
            child: Stack(
              children: [
                // Month view
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 120,
                    width: MediaQuery.of(context).size.width,
                    child: MonthView(
                      monthViewController: monthViewController,
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  child: TopBar(height: 120),
                ),

                Positioned(
                  bottom: 14,
                  right: 14,
                  child: CustomFloatButton(
                    monthViewController: monthViewController,
                  ),
                ),
              ],
            ),
          ),

          // Side menu
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
          ),
        ],
      ),
    );
  }
}
