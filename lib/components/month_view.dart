import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';

import '../providers/date_range_selected_notifier.dart';
import '../utils/calendar_settings.dart';
import '../utils/font_settings.dart';

class MonthView extends ConsumerStatefulWidget {
  const MonthView({super.key, required this.monthViewController});
  final ScrollController monthViewController;

  @override
  ConsumerState<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends ConsumerState<MonthView> {
  late DateTime calendarStartDate;
  late DateTime calendarEndDate;
  late DateTime currentDate;
  late int currentRowIndex;

  // late ScrollController monthViewController;

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
    // monthViewController = ScrollController(initialScrollOffset: currentRowIndex * cellHeight)
    //   ..addListener(() {
    //     ref.read(rowOffsetProvider.notifier).state = monthViewController.offset;
    //   });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // monthViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int numOfRows = (calendarEndDate.difference(calendarStartDate).inDays / 7).floor();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: ListView.builder(
            controller: widget.monthViewController,
            itemCount: numOfRows,
            itemExtent: cellHeight,
            itemBuilder: (context, index) {
              return MonthViewRow(
                rowIndex: index,
                rowWidth: constraints.maxWidth,
                cellHeight: cellHeight,
                weekStartDate:
                    DateTime(calendarStartDate.year, calendarStartDate.month, calendarStartDate.day + (index * 7)),
              );
            },
          ),
        );
      },
    );
  }
}

class MonthViewRow extends StatefulWidget {
  const MonthViewRow({
    super.key,
    required this.rowIndex,
    required this.rowWidth,
    required this.weekStartDate,
    required this.cellHeight,
  });

  final int rowIndex;
  final double rowWidth;
  final DateTime weekStartDate;
  final double cellHeight;

  @override
  State<MonthViewRow> createState() => _MonthViewRowState();
}

class _MonthViewRowState extends State<MonthViewRow> {
  List<Widget> cellsList(double cellWidth, DateTime weekStartDate) {
    List<Widget> cells = [];
    for (int i = 0; i < 7; i++) {
      cells.add(MonthViewCell(
        cellWidth: cellWidth,
        cellHeight: widget.cellHeight,
        cellDate: DateTime(weekStartDate.year, weekStartDate.month, weekStartDate.day + i),
      ));
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: cellsList(widget.rowWidth / 7, widget.weekStartDate),
    );
  }
}

// MonthViewCell have two mode, normal mode & multiday-events selection mode
class MonthViewCell extends ConsumerStatefulWidget {
  const MonthViewCell({
    super.key,
    required this.cellWidth,
    required this.cellDate,
    required this.cellHeight,
  });

  final double cellWidth;
  final double cellHeight;
  final DateTime cellDate;

  @override
  ConsumerState<MonthViewCell> createState() => _MonthViewCellState();
}

class _MonthViewCellState extends ConsumerState<MonthViewCell> {
  final double cellHeight = CalendarSettings.cellHeight;
  bool isSelected = false;

  Widget showYear(DateTime cellDate) {
    if (cellDate.day == 1) {
      return Container(
        height: 20,
        child: Text(
          CustomDateString.monthsShort[cellDate.month - 1],
          style: FontSettings.primaryFont.copyWith(fontSize: 16),
        ),
      );
    } else {
      return SizedBox(
        height: 20,
      );
    }
  }

  bool selectingBehavior(List<DateTime> dateRangeSelected) {
    bool select = false;

    if (dateRangeSelected.isEmpty) {
      return select;
    }

    if (dateRangeSelected.length == 1) {
      if (widget.cellDate.isAtSameMomentAs(dateRangeSelected[0])) select = true;
      return select;
    }

    if (dateRangeSelected.length == 2) {
      if (widget.cellDate.isAtSameMomentAs(dateRangeSelected[0]) ||
          widget.cellDate.isAtSameMomentAs(dateRangeSelected[1]) ||
          widget.cellDate.isAfter(dateRangeSelected[0]) && widget.cellDate.isBefore(dateRangeSelected[1])) {
        select = true;
        return select;
      }
      return select;
    }
    return select;
  }

  @override
  Widget build(BuildContext context) {
    final isSelectingDateRange = ref.watch(isSelectingDateRangeProvider);
    final dateRangeSelected = ref.watch(dateRangeSelectedProvider);
    isSelected = selectingBehavior(dateRangeSelected);

    return GestureDetector(
      onTap: () {
        if (isSelectingDateRange) {
          ref.read(dateRangeSelectedProvider.notifier).toggleDate(widget.cellDate);
        }
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 200),
        scale: isSelectingDateRange
            ? isSelected
                ? 1
                : 0.9
            : 1,
        child: AnimatedContainer(
          width: widget.cellWidth,
          height: cellHeight,
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelectingDateRange
                ? isSelected
                    ? Colors.tealAccent.shade100.withOpacity(.1)
                    : Colors.tealAccent.shade100.withOpacity(.1)
                : Colors.transparent,
            border: Border.all(
              width: 1,
              color: isSelectingDateRange
                  ? isSelected
                      ? Colors.tealAccent.shade200
                      : Colors.tealAccent.shade200.withOpacity(.2)
                  : Colors.transparent,
            ),
            boxShadow: [
              BoxShadow(
                  color: isSelectingDateRange
                      ? isSelected
                          ? Colors.tealAccent.shade200
                          : Colors.transparent
                      : Colors.transparent,
                  offset: const Offset(
                    0,
                    0,
                  ),
                  blurRadius: 5.0,
                  // spreadRadius: 0,
                  blurStyle: BlurStyle.outer), //BoxShadow
            ],
          ),
          curve: Curves.easeInOut,
          child: OverflowBox(
            maxHeight: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showYear(widget.cellDate),
                Container(
                  width: widget.cellWidth,
                  height: cellHeight - 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cellDate.day.toString(),
                        style: FontSettings.primaryFont,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
