import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/search_address_dialog.dart';
import 'package:fyp_our_sky_new/components/set_checklist_dialog.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';
import 'package:isar/isar.dart';

import '../providers/checklist_items_edit_notifier.dart';
import '../providers/checklist_temp_prop.dart';
import '../providers/event_temp.dart';

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

class EventDetailDialog extends ConsumerStatefulWidget {
  const EventDetailDialog({
    super.key,
    required this.date,
    required this.dateIndex,
    required this.mode,
    this.eventIndex = -1,
    required this.eventTemp,
  });

  final String mode;
  final DateTime date;
  final int dateIndex;
  // HHMM in [hour, minu] format
  final int eventIndex;
  final EventTemp eventTemp;

  @override
  ConsumerState<EventDetailDialog> createState() => _EventDetailDialogState();
}

class _EventDetailDialogState extends ConsumerState<EventDetailDialog> {
  late Id id;
  String title = "";
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  String location = "";
  double? lat;
  double? lng;
  late ChecklistTemp checklistTemp;

  double iconSize = 64;
  late FocusNode titleFocusNode;

  TimeOfDay setTime(List<int> timeHourMinute) {
    TimeOfDay time = TimeOfDay(hour: timeHourMinute[0], minute: timeHourMinute[1]);
    return time;
  }

  TimeOfDay adjustEndTime(TimeOfDay time) {
    if (time.hour == 23) {
      return TimeOfDay(hour: time.hour, minute: 59);
    } else {
      return TimeOfDay(hour: time.hour + 1, minute: time.minute);
    }
  }

  bool endTimeSmallerThanStartTime(TimeOfDay startTime, TimeOfDay newEndTime) {
    final flag = (newEndTime.hour + newEndTime.minute / 60.0) < (startTime.hour + startTime.minute / 60.0);
    return flag;
  }

  // init event details
  void initDetails() {
    id = widget.eventTemp.id;
    // Init edit event
    if (widget.mode == "edit") {
      startTime = TimeOfDay(hour: widget.eventTemp.startHourMinute[0], minute: widget.eventTemp.startHourMinute[1]);
      endTime = TimeOfDay(hour: widget.eventTemp.endHourMinute[0], minute: widget.eventTemp.endHourMinute[1]);
      title = widget.eventTemp.title;
      location = widget.eventTemp.location ?? "Add location";
      lat = widget.eventTemp.latlng != null ? widget.eventTemp.latlng![0] : null;
      lng = widget.eventTemp.latlng != null ? widget.eventTemp.latlng![1] : null;
      checklistTemp = widget.eventTemp.checklistTemp;
    }
    // Init create event
    if (widget.mode == "create") {
      startTime = TimeOfDay(hour: widget.eventTemp.startHourMinute[0], minute: widget.eventTemp.startHourMinute[1]);
      endTime = TimeOfDay(hour: startTime.hour + 1, minute: 0);
      if (widget.eventTemp.sticker != null) {
        title = widget.eventTemp.sticker!.tag;
      }
      checklistTemp = widget.eventTemp.checklistTemp;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initDetails();
    titleFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleFocusNode.dispose();
    super.dispose();
  }

  Widget _buildEventTitle() {
    String tempTitle = widget.eventTemp.title;

    return TextField(
      focusNode: titleFocusNode,
      onChanged: (value) {
        title = value;
      },
      onTapOutside: (event) {
        titleFocusNode.unfocus();
      },
      controller: TextEditingController(text: tempTitle),
      style: FontSettings.primaryFont,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white60),
        ),
        labelText: 'Title',
        labelStyle: FontSettings.primaryFont.copyWith(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildStickerIcon() {
    if (widget.eventTemp.sticker != null) {
      final image = base64.decode(widget.eventTemp.sticker!.imageBase64);
      return Container(
        width: iconSize,
        height: iconSize,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(width: 1, color: Colors.white54),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.memory(image),
      );
    }

    if (widget.mode == "edit" && widget.eventTemp != null) {
      final image = base64.decode(widget.eventTemp.sticker!.imageBase64);
      return Container(
        width: iconSize,
        height: iconSize,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(width: 1, color: Colors.white54),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.memory(image),
      );
    }

    return Container(
      width: iconSize,
      height: iconSize,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white54,
        border: Border.all(width: 1, color: Colors.white54),
        borderRadius: BorderRadius.circular(4),
      ),
      // child: Image.memory(image),
    );
  }

  Widget _buildTimeSelection() {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10),
      // height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Start",
                style: FontSettings.primaryFont,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  final newStartTime = await showTimePicker(context: context, initialTime: startTime);
                  if (newStartTime != null) {
                    setState(() {
                      startTime = newStartTime;
                      endTime = adjustEndTime(startTime);
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    "${startTime.to24hours()}",
                    style: FontSettings.primaryFont,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "End",
                style: FontSettings.primaryFont,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  final newEndTime = await showTimePicker(
                    context: context,
                    initialTime: endTime,
                  );
                  if (newEndTime != null) {
                    if (endTimeSmallerThanStartTime(startTime, newEndTime)) {
                      TimeOfDay temp = startTime;
                      setState(() {
                        startTime = newEndTime;
                        endTime = temp;
                      });
                    } else {
                      setState(() {
                        endTime = newEndTime;
                      });
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "${endTime.to24hours()}",
                    style: FontSettings.primaryFont,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSelection() {
    return InkWell(
      onTap: () async {
        final addressDetail = await searchAddress(context: context);
        if (addressDetail != null) {
          setState(() {
            location = addressDetail.name;
            lat = addressDetail.lat;
            lng = addressDetail.lon;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  location == "" ? "Add location" : location,
                  style: FontSettings.primaryFont,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateChecklist() {
    return InkWell(
      onTap: () async {
        ref.watch(checklistItemsEditProvider.notifier).setChecklistTemp(checklistTemp);
        final result = await setChecklist(context: context, checklistTemp: checklistTemp);
        if (result != null) {
          // ref.read();
          setState(() {
            checklistTemp = result;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.checklist_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  checklistTemp.items.isEmpty && checklistTemp.title == "" ? "Create Checklist" : checklistTemp.title,
                  style: FontSettings.primaryFont,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white54),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close_rounded, color: Colors.white),
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white54),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  List<double>? latlng;
                  if (lat != null && lng != null) {
                    latlng = [lat!, lng!];
                  } else {
                    latlng = null;
                  }
                  final dateString = "${widget.date.year}-${widget.date.month}-${widget.date.day}";
                  final event = EventTemp(
                    id: id,
                    title: title,
                    startHourMinute: [startTime.hour, startTime.minute],
                    endHourMinute: [endTime.hour, endTime.minute],
                    sticker: widget.eventTemp.sticker,
                    dateId: dateString,
                    location: location,
                    latlng: latlng,
                    checklistTemp: checklistTemp,
                  );

                  if (widget.mode == "create") {
                    ref.watch(multidayEventDateListProvider.notifier).addEventByDateIndex(widget.dateIndex, event);
                  }
                  if (widget.mode == "edit") {
                    ref
                        .read(multidayEventDateListProvider.notifier)
                        .updateEventByDateIndexAndItemIndex(widget.dateIndex, widget.eventIndex, event);
                  }
                  Navigator.pop(context);
                },
                child: Icon(Icons.check_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(width: 1, color: Colors.white54),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // shrinkWrap: true,
            children: [
              _buildStickerIcon(),
              SizedBox(height: 10),
              _buildEventTitle(),
              SizedBox(height: 10),
              _buildTimeSelection(),
              SizedBox(height: 10),
              _buildLocationSelection(),
              SizedBox(height: 10),
              _buildCreateChecklist(),
              SizedBox(height: 10),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> createEventDetail({
  required BuildContext context,
  required DateTime date,
  required int dateIndex,
  required EventTemp eventTemp,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return EventDetailDialog(
        date: date,
        dateIndex: dateIndex,
        eventTemp: eventTemp,
        mode: "create",
      );
    },
  );
}

Future<void> editEventDetail({
  required BuildContext context,
  required DateTime date,
  required int dateIndex,
  required int eventIndex,
  // required DateTime? latestStartTimeAvailable,
  required EventTemp eventTemp,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return EventDetailDialog(
        date: date,
        dateIndex: dateIndex,
        eventIndex: eventIndex,
        eventTemp: eventTemp,
        mode: "edit",
      );
    },
  );
}
