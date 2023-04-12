import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/multiday_event_structured.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';

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
            bottom: 0,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: MonthViewBottomPanelList(),
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

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 400,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        child: ListView.builder(
          itemCount: multidayEventStructured.events.length,
          itemBuilder: (context, index) {
            print(index);
            if (multidayEventStructured.events[index] == null) return SizedBox();
            return BottomPanelEventListTile(
              event: multidayEventStructured.events[index],
              multidayEvent: multidayEventStructured.multidayEvents,
            );
          },
        ),
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
    final timeProgress = startTime.difference(now).inMinutes.abs();
    final double progressRatio =
        timeProgress >= totalMinutes ? totalMinutes / totalMinutes : timeProgress / totalMinutes;

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
    return Flexible(
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
              _timeStringHHMMFmt(event.endHourMinute),
              style: FontSettings.primaryFont.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSticker(String stickerId) {
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
    print("Hello");
    if (event == null) return SizedBox();

    final dateSplit = event!.dateId.split("-");
    final date = DateTime(int.parse(dateSplit[0]), int.parse(dateSplit[1]), int.parse(dateSplit[2]));

    final startTime = DateTime(date.year, date.month, date.day, event!.startHourMinute[0], event!.startHourMinute[1]);
    final endTime = DateTime(date.year, date.month, date.day, event!.endHourMinute[0], event!.endHourMinute[1]);
    final now = DateTime.now();

    return Opacity(
      opacity: now.isAfter(endTime) ? 0.25 : 1,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 96,
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
    );
  }
}