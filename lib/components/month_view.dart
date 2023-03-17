import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';

import '../utils/calendar_settings.dart';
import '../utils/font_settings.dart';

class MonthView extends ConsumerStatefulWidget {
  const MonthView({super.key});

  @override
  ConsumerState<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends ConsumerState<MonthView> {
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
    final int numOfRows = (calendarEndDate.difference(calendarStartDate).inDays / 7).floor();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: ListView.builder(
            controller: monthViewController,
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
class MonthViewCell extends StatefulWidget {
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
  State<MonthViewCell> createState() => _MonthViewCellState();
}

class _MonthViewCellState extends State<MonthViewCell> {
  final double cellHeight = CalendarSettings.cellHeight;

  Widget showYear(DateTime cellDate) {
    if (cellDate.day == 1) {
      return Container(
        height: 20,
        child: Text(
          CustomDateString.monthsShort[cellDate.month - 1],
          style: FontSettings.primaryFont,
        ),
      );
    } else {
      return SizedBox(
        height: 20,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: widget.cellWidth,
      height: cellHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showYear(widget.cellDate),
          Text(
            widget.cellDate.day.toString(),
            style: FontSettings.primaryFont,
          ),
        ],
      ),
    );
  }
}
