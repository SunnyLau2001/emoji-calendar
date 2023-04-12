import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/providers/sticker_provider.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../models/date_detail.dart';
import '../models/event.dart';
import '../models/multiday_event.dart';
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
  late String dateString;

  @override
  void initState() {
    super.initState();
    dateString = "${widget.cellDate.year}-${widget.cellDate.month}-${widget.cellDate.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          context.goNamed('singleDatePage', extra: widget.cellDate);
        },
        child: Container(
          child: Stack(children: [
            Positioned(
              top: 40,
              child: MonthViewCellNormalMode(
                cellDate: widget.cellDate,
                height: widget.cellHeight - 40,
                cellWidth: widget.cellWidth,
                dateString: dateString,
              ),
            ),
            MonthViewCellDateRangeMode(
              cellDate: widget.cellDate,
              cellHeight: widget.cellHeight,
              cellWidth: widget.cellWidth,
              dateString: dateString,
            ),
          ]),
        ),
      ),
    );
  }
}

class MonthViewCellNormalMode extends ConsumerWidget {
  const MonthViewCellNormalMode({
    super.key,
    required this.cellDate,
    required this.height,
    required this.cellWidth,
    required this.dateString,
  });

  final double height;
  final double cellWidth;
  final DateTime cellDate;
  final String dateString;
  // bool isSelected = false;

  Widget _buildMultidayEventTracks(DateDetailStructured dateDetailStructured, double width) {
    if (dateDetailStructured.multidayEvents.isEmpty) return Container();

    final availableTracks = dateDetailStructured.dateDetail!.availableTracks;
    List<MultidayEvent?> tracksMultidayEvent = [null, null, null];
    List<List<Event?>> tracksEventsList = [[], [], []];

    for (int i = 0; i < availableTracks.length; i++) {
      for (int j = 0; j < dateDetailStructured.multidayEvents.length; j++) {
        if (dateDetailStructured.multidayEvents[j] == null) continue;

        if (dateDetailStructured.multidayEvents[j]!.id == availableTracks[i]) {
          tracksMultidayEvent[i] = dateDetailStructured.multidayEvents[j];
          continue;
        }
      }
    }
    for (int i = 0; i < tracksMultidayEvent.length; i++) {
      if (tracksMultidayEvent[i] == null) continue;
      for (int j = 0; j < dateDetailStructured.events.length; j++) {
        if (dateDetailStructured.events[j] == null) continue;
        if (dateDetailStructured.events[j]!.multidayEventId == tracksMultidayEvent[i]!.id) {
          tracksEventsList[i].add(dateDetailStructured.events[j]);
        }
      }
    }

    List<Widget> tracks = [];
    for (int i = 0; i < tracksEventsList.length; i++) {
      tracks.add(
        Positioned(
          top: width / 2 * i,
          child: MonthViewCellTrack(
              width: width,
              date: cellDate,
              dateString: dateString,
              multidayEvent: tracksMultidayEvent[i],
              events: tracksEventsList[i]),
        ),
      );
    }
    return Stack(
      children: [...tracks.reversed.toList()],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateDetailStructuredWatcher = ref.watch(dateDetailStructuredWatcherProvider(dateString: dateString));

    return dateDetailStructuredWatcher.when(
      data: (dateDetailStructured) {
        if (dateDetailStructured != null) {
          return Container(
            height: height,
            width: cellWidth,
            decoration: BoxDecoration(),
            child: _buildMultidayEventTracks(dateDetailStructured, cellWidth),
          );
        }
        return Container();
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }
}

class MonthViewCellTrack extends ConsumerWidget {
  const MonthViewCellTrack({
    super.key,
    required this.width,
    required this.date,
    required this.dateString,
    required this.multidayEvent,
    required this.events,
  });

  final double width;
  final DateTime date;
  final String dateString;
  final MultidayEvent? multidayEvent;
  final List<Event?> events;

  Widget _buildTrackBox(
      double height, double width, int numOfEvents, List<Event?> events, MultidayEvent? multidayEvent, bool highlight) {
    if (multidayEvent == null) return Container();
    if (events.isEmpty) return Container();

    // final numOfEvents = events.length > 4 ? 4 : events.length;
    return Opacity(
      opacity: highlight ? 1 : 0.25,
      child: Container(
        padding: EdgeInsets.all(4),
        width: width,
        height: height,
        decoration: BoxDecoration(color: Color(multidayEvent.bookmarkColorInt), borderRadius: BorderRadius.circular(4)),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: numOfEvents,
          itemBuilder: (context, index) {
            if (events[index] == null) return Container();
            return Consumer(
              builder: (context, ref, child) {
                final sticker = ref.watch(fetchStickerByIdProvider(stickerId: events[index]!.stickerId));

                return sticker.when(
                  data: (data) {
                    if (data != null) {
                      final image = base64.decode(data.imageBase64);
                      return Container(
                        child: Image.memory(image),
                      );
                    }
                    return Container();
                  },
                  error: (error, stackTrace) {
                    return Container();
                  },
                  loading: () {
                    return Container();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrackBase(double height, double width, MultidayEvent? multidayEvent, bool highlight) {
    if (multidayEvent == null) return Container();
    return Opacity(
      opacity: highlight ? 1 : 0.25,
      child: Container(
        height: 4,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(multidayEvent.bookmarkColorInt),
        ),
      ),
    );
  }

  Widget _buildStartPoint(MultidayEvent? multidayEvent, double top, bool highlight) {
    if (multidayEvent == null) return Container();

    return Positioned(
      top: top - 4,
      left: -6,
      child: Opacity(
        opacity: highlight ? 1 : 0.25,
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: Color(multidayEvent.bookmarkColorInt),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.white, offset: Offset(0, 0), blurRadius: 2.0, blurStyle: BlurStyle.outer), //BoxShadow
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEndPoint(MultidayEvent? multidayEvent, double top, bool highlight) {
    if (multidayEvent == null) return Container();

    return Positioned(
      top: top - 4,
      right: -6,
      child: Opacity(
        opacity: highlight ? 1 : 0.25,
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: Color(multidayEvent.bookmarkColorInt),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(color: Colors.white, offset: Offset(0, 0), blurRadius: 2.0, blurStyle: BlurStyle.outer),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (multidayEvent == null) return Container();

    final numOfEvents = events.length > 4 ? 4 : events.length;
    final height = numOfEvents <= 2 ? width / 2 : width;
    final decorationHeight = width / 4;

    final now = DateTime.now();
    bool highlight = false;
    final start = multidayEvent!.startDate.split("-");
    final end = multidayEvent!.endDate.split("-");
    DateTime startDate = DateTime(int.parse(start[0]), int.parse(start[1]), int.parse(start[2]));
    DateTime endDate = DateTime(int.parse(end[0]), int.parse(end[1]), int.parse(end[2]) + 1);

    final isStart = multidayEvent!.startDate == dateString;
    final isEnd = multidayEvent!.endDate == dateString;

    if (startDate == endDate) {
      endDate = DateTime(endDate.year, endDate.month, endDate.day + 1);
    }
    if (now.isAfter(startDate) && now.isBefore(endDate)) {
      highlight = true;
    }

    return Consumer(
      builder: (context, ref, child) {
        final isSelectingDateRange = ref.watch(isSelectingDateRangeProvider);
        return Visibility(
          visible: !isSelectingDateRange,
          child: GestureDetector(
            onTap: () {
              ref.watch(bottomPanelMultidayEventId.notifier).state = multidayEvent!.id;
              ref.watch(showBottomPanelProvider.notifier).state = true;
              print(multidayEvent!.id);
            },
            child: Container(
              height: height,
              width: width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: decorationHeight - 4,
                    child: numOfEvents == 0 ? _buildTrackBase(height, width, multidayEvent, highlight) : Container(),
                  ),
                  Positioned(
                    top: 0,
                    child: _buildTrackBox(height, width, numOfEvents, events, multidayEvent, highlight),
                  ),
                  isStart
                      ? _buildStartPoint(
                          multidayEvent,
                          decorationHeight - 4,
                          highlight,
                        )
                      : SizedBox(),
                  isEnd
                      ? _buildEndPoint(
                          multidayEvent,
                          decorationHeight - 4,
                          highlight,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MonthViewCellDateRangeMode extends ConsumerWidget {
  const MonthViewCellDateRangeMode({
    super.key,
    required this.cellDate,
    required this.cellHeight,
    required this.cellWidth,
    required this.dateString,
  });

  final double cellHeight;
  final double cellWidth;
  final DateTime cellDate;
  final String dateString;

  Widget _showYear(DateTime cellDate) {
    if (cellDate.day == 1) {
      return SizedBox(
        height: 20,
        child: Text(
          CustomDateString.monthsShort[cellDate.month - 1],
          style: FontSettings.primaryFont.copyWith(fontSize: 16),
        ),
      );
    } else {
      return const SizedBox(
        height: 20,
      );
    }
  }

  bool _selectingBehavior(List<DateTime> dateRangeSelected) {
    bool select = false;

    if (dateRangeSelected.isEmpty) {
      return select;
    }

    if (dateRangeSelected.length == 1) {
      if (cellDate.isAtSameMomentAs(dateRangeSelected[0])) select = true;
      return select;
    }

    if (dateRangeSelected.length == 2) {
      if (cellDate.isAtSameMomentAs(dateRangeSelected[0]) ||
          cellDate.isAtSameMomentAs(dateRangeSelected[1]) ||
          cellDate.isAfter(dateRangeSelected[0]) && cellDate.isBefore(dateRangeSelected[1])) {
        select = true;
        return select;
      }
      return select;
    }
    return select;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToday = cellDate.isAtSameMomentAs(ref.read(currentDateProvider));
    final isSelectingDateRange = ref.watch(isSelectingDateRangeProvider);
    final dateRangeSelected = ref.watch(multidayEventDetailProvider).dateRange;
    final isSelected = _selectingBehavior(dateRangeSelected);

    return IgnorePointer(
      ignoring: !isSelectingDateRange,
      child: GestureDetector(
        onTap: () {
          ref.read(multidayEventDetailProvider.notifier).toggleDate(cellDate);
        },
        child: AnimatedScale(
          duration: Duration(milliseconds: 200),
          scale: isSelectingDateRange
              ? isSelected
                  ? 1
                  : 0.9
              : 1,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: cellHeight,
            width: cellWidth,
            decoration: BoxDecoration(
              color: isSelectingDateRange
                  ? isSelected
                      ? Colors.tealAccent.shade100.withOpacity(.1)
                      : Colors.tealAccent.shade100.withOpacity(.1)
                  : isToday
                      ? Colors.lightBlueAccent.shade100.withOpacity(.1)
                      : Colors.transparent,
              border: Border.all(
                width: 1,
                color: isSelectingDateRange
                    ? isSelected
                        ? Colors.tealAccent.shade200
                        : Colors.tealAccent.shade200.withOpacity(.2)
                    : isToday
                        ? Colors.white54
                        : Colors.transparent,
              ),
              boxShadow: [
                BoxShadow(
                    color: isSelectingDateRange
                        ? isSelected
                            ? Colors.tealAccent.shade200
                            : Colors.transparent
                        : isToday
                            ? Colors.white54
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
            child: OverflowBox(
              maxHeight: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _showYear(cellDate),
                  Container(
                    width: cellWidth,
                    height: cellHeight - 20, // 140
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cellDate.day.toString(),
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
      ),
    );
  }
}
