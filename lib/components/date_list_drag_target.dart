import 'dart:convert';
import 'dart:ui';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/set_event_detail_dialog.dart';
import 'package:fyp_our_sky_new/providers/checklist_temp_prop.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';
import 'package:isar/isar.dart';

import '../models/sticker.dart';
import '../providers/event_temp.dart';
import '../providers/multiday_event_date_list_prop.dart';

class DateListDragTarget extends ConsumerStatefulWidget {
  const DateListDragTarget({
    super.key,
    required this.date,
    required this.dateIndex,
  });

  final DateTime date;
  final int dateIndex;

  @override
  ConsumerState<DateListDragTarget> createState() => _DateListDragTarget();
}

class _DateListDragTarget extends ConsumerState<DateListDragTarget> {
  final _monthNames = CustomDateString.monthsShort;
  final _weekdayNames = CustomDateString.weekdayShort;

  @override
  Widget build(BuildContext context) {
    final dateString = "${widget.date.year}-${widget.date.month}-${widget.date.day}";
    final focusedDate = ref.watch(focusedDateEventsListProvider);

    // final mEventDateListProp = ref.watch(
    //     multidayEventDateListProvider.select((e) => e.firstWhere((element) => element.dateString == dateString)));
    final mEventDateList = ref.watch(multidayEventDateListProvider);
    if (mEventDateList.length <= 0) return SizedBox();
    print(mEventDateList);
    MultidayEventDateListProp? mEventDateListProp;
    for (int i = 0; i < mEventDateList.length; i++) {
      if (mEventDateList[i].dateString == dateString) {
        mEventDateListProp = mEventDateList[i];
        break;
      }
    }
    // final mEventDateListProp = mEventDateList.firstWhere((element) => element.dateString == dateString);
    if (mEventDateListProp == null) return SizedBox();

    // if (mEventDateList.isEmpty) return SizedBox();
    // print(mEventDateList);
    // final mEventDateListProp = mEventDateList.firstWhere((element) => element.dateString == dateString);

    // if (list.isEmpty) return SizedBox();
    final List<EventTemp> events = mEventDateListProp.events;
    final List<int>? latestStartTimeAvailable = events.isNotEmpty ? events[events.length - 1].endHourMinute : null;
    return AnimatedAlign(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
      heightFactor: focusedDate == '' || focusedDate == dateString ? 1 : 0,
      child: AnimatedScale(
        duration: Duration(milliseconds: 0),
        curve: Curves.ease,
        scale: focusedDate == '' || focusedDate == dateString ? 1 : 0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white54),
            color: Colors.white12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _monthNames[widget.date.month - 1],
                        style: FontSettings.primaryFont.copyWith(fontSize: 14),
                      ),
                      Text(
                        "${_weekdayNames[widget.date.weekday - 1]} ${widget.date.day}",
                        style: FontSettings.primaryFont.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Spacer(),
                  Consumer(
                    builder: (context, ref, child) {
                      final editingDateIndex = ref.watch(dateListInEditingModeProvider);
                      final isEditing = editingDateIndex == widget.dateIndex;
                      return Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {
                            if (!isEditing) {
                              ref.watch(dateListInEditingModeProvider.notifier).state = widget.dateIndex;
                            }
                            if (isEditing) {
                              ref.watch(dateListInEditingModeProvider.notifier).state = -1;
                            }
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: isEditing
                                ? Icon(Icons.close_rounded, color: Colors.white)
                                : Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              AnimatedEventList(
                // events: list,
                date: widget.date,
                dateIndex: widget.dateIndex,
                // events: events,
              ),
              // // ..._buildEvents(list, widget.dayIndex, ref),
              Consumer(
                builder: (context, ref, child) {
                  final isEditing = ref.watch(dateListInEditingModeProvider) == widget.dateIndex;
                  return Visibility(
                    visible: !isEditing,
                    child: DummyDragTarget(
                      date: widget.date,
                      dateString: dateString,
                      dateIndex: widget.dateIndex,
                      latestStartTimeAvailable: latestStartTimeAvailable,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    // return AnimatedAlign(
    //   alignment: Alignment.center,
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.ease,
    //   heightFactor: focusedDate == '' || focusedDate == dateString ? 1 : 0,
    //   child: AnimatedScale(
    //     duration: Duration(milliseconds: 0),
    //     curve: Curves.ease,
    //     scale: focusedDate == '' || focusedDate == dateString ? 1 : 0,
    //     child: Container(
    //       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    //       padding: EdgeInsets.symmetric(vertical: 8),
    //       decoration: BoxDecoration(
    //         border: Border.all(width: 1, color: Colors.white54),
    //         color: Colors.white12,
    //         borderRadius: BorderRadius.circular(4),
    //       ),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     _monthNames[widget.date.month - 1],
    //                     style: FontSettings.primaryFont.copyWith(fontSize: 14),
    //                   ),
    //                   Text(
    //                     "${_weekdayNames[widget.date.weekday - 1]} ${widget.date.day}",
    //                     style: FontSettings.primaryFont.copyWith(fontSize: 18),
    //                   ),
    //                 ],
    //               ),
    //               Spacer(),
    //               Consumer(
    //                 builder: (context, ref, child) {
    //                   final editingDateIndex = ref.watch(dateListInEditingModeProvider);
    //                   final isEditing = editingDateIndex == widget.dateIndex;
    //                   return Material(
    //                     type: MaterialType.transparency,
    //                     child: InkWell(
    //                       customBorder: CircleBorder(),
    //                       onTap: () {
    //                         if (!isEditing) {
    //                           ref.read(dateListInEditingModeProvider.notifier).state = widget.dateIndex;
    //                         }
    //                         if (isEditing) {
    //                           ref.read(dateListInEditingModeProvider.notifier).state = -1;
    //                         }
    //                       },
    //                       child: Container(
    //                         width: 48,
    //                         height: 48,
    //                         decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                         ),
    //                         child: isEditing
    //                             ? Icon(Icons.close_rounded, color: Colors.white)
    //                             : Icon(Icons.edit, color: Colors.white),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ],
    //           ),
    //           AnimatedEventList(
    //             // events: list,
    //             date: widget.date,
    //             dateIndex: widget.dateIndex,
    //             // events: events,
    //           ),
    //           // // ..._buildEvents(list, widget.dayIndex, ref),
    //           Consumer(
    //             builder: (context, ref, child) {
    //               final isEditing = ref.watch(dateListInEditingModeProvider) == widget.dateIndex;
    //               return Visibility(
    //                 visible: !isEditing,
    //                 child: DummyDragTarget(
    //                   date: widget.date,
    //                   dateString: dateString,
    //                   dateIndex: widget.dateIndex,
    //                   latestStartTimeAvailable: latestStartTimeAvailable,
    //                 ),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class AnimatedEventList extends ConsumerWidget {
  AnimatedEventList({
    super.key,
    required this.date,
    required this.dateIndex,
  });

  final DateTime date;
  final int dateIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mEventDateList = ref.watch(multidayEventDateListProvider);

    final events = mEventDateList[dateIndex].events;

    return ImplicitlyAnimatedList<EventTemp>(
      items: events,
      shrinkWrap: true,
      areItemsTheSame: (oldItem, newItem) {
        return oldItem == newItem;
      },
      physics: const NeverScrollableScrollPhysics(),
      insertDuration: Duration(milliseconds: 200),
      itemBuilder: (context, animation, event, index) {
        return SizeFadeTransition(
          animation: animation,
          child: EventItemTile(
            date: date,
            dateIndex: dateIndex,
            event: event,
            eventIndex: index,
          ),
        );
      },
    );
  }
}

class EventItemTile extends ConsumerWidget {
  const EventItemTile({
    super.key,
    required this.date,
    required this.dateIndex,
    required this.event,
    required this.eventIndex,
  });

  final DateTime date;
  final int dateIndex;
  final EventTemp event;
  final int eventIndex;

  String _timeStringHHMMFmt(List<int> time) {
    final hour = time[0].toString().padLeft(2, "0");
    final min = time[1].toString().padLeft(2, "0");
    return "$hour:$min";
  }

  Widget _buildTime() {
    return Flexible(
      child: Row(
        children: [
          Container(
            child: Text(
              _timeStringHHMMFmt(event.startHourMinute),
              style: FontSettings.primaryFont,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Text(
              _timeStringHHMMFmt(event.endHourMinute),
              style: FontSettings.primaryFont,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSticker(Sticker? sticker) {
    if (sticker != null) {
      final image = base64.decode(sticker.imageBase64);
      return Container(
        padding: EdgeInsets.all(4),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(width: 1, color: Colors.white10),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.memory(
          image,
          gaplessPlayback: true,
        ),
      );
    }
    return Container();
  }

  Widget _buildTitle() {
    return Container(
      child: Text(
        event.title,
        style: FontSettings.primaryFont,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildLocation() {
    if (event.location != null && event.location != "") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Icon(
              Icons.location_on,
              color: Colors.white,
              size: 14,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            child: Text(
              event.location ?? "",
              style: FontSettings.primaryFont,
            ),
          ),
        ],
      );
    }

    return Container();
  }

  Widget _buildDeleteButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isEditing = ref.watch(dateListInEditingModeProvider) == dateIndex;

        return IgnorePointer(
          ignoring: !isEditing,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: isEditing ? 1 : 0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  ref.watch(multidayEventDateListProvider.notifier).removeEventByDateIndex(dateIndex, event);
                  // ref.watch(multidayEventDateListProvider.notifier).removeEventByDateIndex(dateIndex, event);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(dateListInEditingModeProvider) == dateIndex;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () async {
          if (!isEditing) {
            await editEventDetail(
                context: context, date: date, dateIndex: dateIndex, eventIndex: eventIndex, eventTemp: event);
          }
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTime(),
              Row(
                children: [
                  _buildSticker(event.sticker),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTitle(),
                      _buildLocation(),
                    ],
                  ),
                  Spacer(),
                  _buildDeleteButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyDragTarget extends ConsumerWidget {
  const DummyDragTarget({
    super.key,
    required this.date,
    required this.dateString,
    required this.dateIndex,
    this.latestStartTimeAvailable,
  });

  final DateTime date;
  final String dateString;
  final int dateIndex;
  final List<int>? latestStartTimeAvailable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DragTarget(
      onAccept: (Sticker sticker) async {
        final checklistTemp = ChecklistTemp(id: Isar.autoIncrement, title: "", items: []);
        final startHM = latestStartTimeAvailable ?? [8, 0];
        final endHM = [startHM[0] + 1, 0];

        final eventTemp = EventTemp(
          id: Isar.autoIncrement,
          title: "Title",
          startHourMinute: startHM,
          endHourMinute: endHM,
          sticker: sticker,
          dateId: dateString,
          checklistTemp: checklistTemp,
        );

        await createEventDetail(
          context: context,
          date: date,
          dateIndex: dateIndex,
          eventTemp: eventTemp,
        );
      },
      onLeave: (data) {
        ref.watch(activedDummyTargetIndexProvider.notifier).state = -1;
      },
      onMove: (data) {
        ref.watch(activedDummyTargetIndexProvider.notifier).state = dateIndex;
      },
      builder: (context, candidateData, rejectedData) {
        return Consumer(
          builder: (context, ref, child) {
            final activated = ref.watch(activedDummyTargetIndexProvider) == dateIndex;
            // final dragging = ref.watch(stickerDraggingProvider);
            String dummyHints = "Drop to add event";
            // if (list.length == 0 && !dragging) dummyHints = "You haven't add any event yet";
            // bool showDefaultHints = list.isEmpty;

            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: AnimatedOpacity(
                  opacity: activated ? 1 : 0.5,
                  duration: Duration(milliseconds: true ? 300 : 0),
                  child: AnimatedContainer(
                    height: 60.0,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 400),
                    margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        // color: dragging
                        //         ? Colors.grey[200]
                        //         : Colors.white,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: 1,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            dummyHints,
                            style: FontSettings.primaryFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
