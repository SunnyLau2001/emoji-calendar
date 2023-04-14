import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/view_checklist_dialog.dart';
import 'package:fyp_our_sky_new/models/multiday_event_structured.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_prop.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_prop.dart';
import 'package:go_router/go_router.dart';

import '../models/event.dart';
import '../models/multiday_event.dart';
import '../providers/providers.dart';
import '../providers/sticker_provider.dart';
import '../utils/font_settings.dart';

class MonthViewBottomPanel extends ConsumerWidget {
  const MonthViewBottomPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showBottomPanel = ref.watch(showBottomPanelProvider);

    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      bottom: showBottomPanel ? 0 : -400,
      curve: Curves.easeInOut,
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(4)),
        ),
        child: const MonthViewBottomPanelDetails(),
      ),
    );
  }
}

class MonthViewBottomPanelDetails extends ConsumerWidget {
  const MonthViewBottomPanelDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: MonthViewBottomPanelList(),
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    ref.watch(showBottomPanelProvider.notifier).state = false;
                  },
                  child: Icon(Icons.close_rounded),
                ),
              ),
            ),
          ),
          Positioned(
            top: 54,
            right: 14,
            child: Consumer(
              builder: (context, ref, child) {
                final multidayEventId = ref.watch(bottomPanelMultidayEventId);
                final multidayEventWatcher =
                    ref.watch(multidayEventStructuredWatcherProvider(multidayEventId: multidayEventId));

                return multidayEventWatcher.when(
                  data: (data) {
                    if (data == null) return SizedBox();
                    final MultidayEventDetailProp mProp = data.mEventDetailProp;
                    final List<MultidayEventDateListProp> mList = data.mEventDateListProps;
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 40,
                      width: 40,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            ref.watch(multidayEventDetailProvider.notifier).setMultidayEventDetailProp(mProp);
                            ref.watch(multidayEventDateListProvider.notifier).setMultidayEventDateListPropList(mList);
                            context.go("/multidayEventEdit");
                            // ref.watch(showBottomPanelProvider.notifier).state = false;
                          },
                          child: Icon(Icons.edit),
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return SizedBox();
                  },
                  loading: () {
                    return SizedBox();
                  },
                );

                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  height: 40,
                  width: 40,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () async {
                        // ref.watch(showBottomPanelProvider.notifier).state = false;
                      },
                      child: Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MonthViewBottomPanelList extends ConsumerWidget {
  const MonthViewBottomPanelList({
    super.key,
  });

  Widget _buildEventsListView(
    double width,
    MultidayEventStructured? multidayEventStructured,
  ) {
    if (multidayEventStructured == null) return SizedBox();
    final String title = multidayEventStructured.multidayEvents == null
        ? ""
        : multidayEventStructured.multidayEvents!.title == ""
            ? "(No Title)"
            : multidayEventStructured.multidayEvents!.title;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 400,
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: FontSettings.primaryFont.copyWith(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 320,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: ListView.builder(
                itemCount: multidayEventStructured.events.length,
                itemBuilder: (context, index) {
                  if (multidayEventStructured.events[index] == null) return SizedBox();
                  return BottomPanelEventListTile(
                    event: multidayEventStructured.events[index],
                    multidayEvent: multidayEventStructured.multidayEvents,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multidayEventId = ref.watch(bottomPanelMultidayEventId);
    final multidayEventWatcher = ref.watch(multidayEventStructuredWatcherProvider(multidayEventId: multidayEventId));
    return Container(
      alignment: Alignment.center,
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: multidayEventWatcher.when(
        data: (data) {
          if (data == null) return SizedBox();
          return _buildEventsListView(MediaQuery.of(context).size.width, data);
        },
        error: (error, stackTrace) {
          return SizedBox();
        },
        loading: () {
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class BottomPanelEventListTile extends ConsumerWidget {
  const BottomPanelEventListTile({
    super.key,
    required this.event,
    required this.multidayEvent,
  });

  final Event? event;
  final MultidayEvent? multidayEvent;

  String _timeStringHHMMFmt(List<int> time) {
    final hour = time[0].toString().padLeft(2, "0");
    final min = time[1].toString().padLeft(2, "0");
    return "$hour:$min";
  }

  Widget _buildTimeIndicatorBar(
      Event event, MultidayEvent? multidayEvent, DateTime startTime, DateTime endTime, DateTime now) {
    if (multidayEvent == null)
      return const SizedBox(
        width: 20,
      );
    final totalMinutes = startTime.difference(endTime).inMinutes.abs();
    final timeProgress = now.difference(startTime).inMinutes;
    double progressRatio = 0;
    if (timeProgress >= 0 && timeProgress < totalMinutes) progressRatio = timeProgress / totalMinutes;
    if (timeProgress >= totalMinutes) progressRatio = totalMinutes.toDouble();

    return Container(
      height: 64,
      width: 20,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 64,
            width: 4,
            color: Colors.grey.shade600,
          ),
          Container(
            height: 64 * progressRatio,
            width: 4,
            color: Color(multidayEvent.bookmarkColorInt),
          ),
        ],
      ),
    );
  }

  Widget _buildTime(Event event) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            event.dateId,
            style: FontSettings.primaryFont.copyWith(color: Colors.black),
          ),
        ),
        Flexible(
          child: Row(
            children: [
              Container(
                child: Text(
                  _timeStringHHMMFmt(event.startHourMinute),
                  style: FontSettings.primaryFont.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "-",
                  style: FontSettings.primaryFont.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  _timeStringHHMMFmt(event.endHourMinute),
                  style: FontSettings.primaryFont.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSticker(String? stickerId) {
    if (stickerId == null)
      return SizedBox(
        width: 40,
        height: 40,
      );

    return Consumer(
      builder: (context, ref, child) {
        final sticker = ref.watch(fetchStickerByIdProvider(stickerId: stickerId));
        return sticker.when(
          data: (data) {
            if (data == null) return SizedBox();
            final image = base64.decode(data.imageBase64);
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
          },
          error: (error, stackTrace) {
            return SizedBox();
          },
          loading: () {
            return SizedBox();
          },
        );
        // return
      },
    );
  }

  Widget _buildTitle(Event event) {
    return Container(
      child: Text(
        event.title,
        style: FontSettings.primaryFont.copyWith(color: Colors.black),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildLocation(Event event) {
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
              color: Colors.black,
              size: 14,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            child: Text(
              event.location ?? "",
              style: FontSettings.primaryFont.copyWith(color: Colors.black),
            ),
          ),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (event == null) return SizedBox();

    final dateSplit = event!.dateId.split("-");
    final date = DateTime(int.parse(dateSplit[0]), int.parse(dateSplit[1]), int.parse(dateSplit[2]));

    final startTime = DateTime(date.year, date.month, date.day, event!.startHourMinute[0], event!.startHourMinute[1]);
    final endTime = DateTime(date.year, date.month, date.day, event!.endHourMinute[0], event!.endHourMinute[1]);
    final now = DateTime.now();

    return Opacity(
      opacity: now.isAfter(endTime) ? 0.25 : 1,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () async {
            if (event!.checklistId != null)
              await viewChecklistOfEvent(context: context, checklistId: event!.checklistId!);
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            height: 120,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTime(event!),
                Row(
                  children: [
                    _buildTimeIndicatorBar(event!, multidayEvent, startTime, endTime, now),
                    _buildSticker(event!.stickerId),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTitle(event!),
                        _buildLocation(event!),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
