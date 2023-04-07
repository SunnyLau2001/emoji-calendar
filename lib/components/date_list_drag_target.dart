import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_prop.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

import '../models/event.dart';

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
    print("drag target");
    final dateString = "${widget.date.year}-${widget.date.month}-${widget.date.day}";

    final MultidayEventDateListProp dateListProp = ref.watch(multidayEventDateListProvider
        .select((value) => value.firstWhere((element) => element.dateString == dateString)));

    final List<Event> events = dateListProp.events;

    return Consumer(
      builder: (context, ref, child) {
        final focusedDate = ref.watch(focusedDateEventsListProvider);

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
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {
                            // ref.watch(eventsProvider.notifier).removeAllEventsFromDay(widget.dayIndex);
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // AnimatedEventList(
                  //   // events: list,
                  //   dayIndex: widget.dayIndex,
                  // ),
                  // // ..._buildEvents(list, widget.dayIndex, ref),
                  // _buildDummyTarget(context, ref, widget.dayIndex, list, latestStartTimeAvailable),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class DummyDragTarget extends ConsumerWidget {
//   const DummyDragTarget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return DragTarget(
//       onAccept: (EmojiItem data) async {
//         final event =
//             await addEventDetail(context: context, emojiItem: data, latestStartTimeAvailable: latestStartTimeAvailable);

//         ref.read(activedDummyTargetIndexProvider.notifier).state = -1;
//         ref.read(stickerDraggingProvider.notifier).state = false;

//         if (event != null) {
//           addEvent(ref, data, event);
//         }
//       },
//       onLeave: (data) {
//         ref.read(activedDummyTargetIndexProvider.notifier).state = -1;
//       },
//       onMove: (data) {
//         ref.read(activedDummyTargetIndexProvider.notifier).state = dayIndex;
//       },
//       builder: (context, candidateData, rejectedData) {
//         return Consumer(
//           builder: (context, ref, child) {
//             final activated = ref.watch(activedDummyTargetIndexProvider) == dayIndex;
//             final dragging = ref.watch(stickerDraggingProvider);
//             String dummyHints = "Drop to add event";
//             if (list.length == 0 && !dragging) dummyHints = "You haven't add any event yet";
//             bool showDefaultHints = list.isEmpty;

//             return AnimatedOpacity(
//               opacity: activated ? 1 : 0.3,
//               duration: Duration(milliseconds: activated ? 300 : 0),
//               child: AnimatedContainer(
//                 height: 60.0,
//                 curve: Curves.easeInOut,
//                 duration: Duration(milliseconds: 400),
//                 margin: EdgeInsets.only(top: 8, left: 8, right: 8),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: showDefaultHints
//                       ? dragging
//                           ? Colors.grey[200]
//                           : Colors.white
//                       : Colors.grey[200],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AnimatedOpacity(
//                       opacity: 1,
//                       duration: Duration(milliseconds: 200),
//                       child: Text(dummyHints),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
