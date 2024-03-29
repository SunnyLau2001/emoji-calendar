import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/date_detail_structured.dart';
import 'package:fyp_our_sky_new/models/multiday_event.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/services/open_weather_service.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';
import 'package:go_router/go_router.dart';

import '../models/event.dart';
import '../models/sticker.dart';
import '../providers/multiday_event_date_list_notifier.dart';
import '../providers/multiday_event_date_list_prop.dart';
import '../providers/multiday_event_detail_notifier.dart';
import '../providers/multiday_event_detail_prop.dart';
import '../providers/providers.dart';
import '../providers/sticker_provider.dart';

class SingleDateViewPage extends ConsumerStatefulWidget {
  SingleDateViewPage({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  ConsumerState<SingleDateViewPage> createState() => _SingleDateViewPageState();
}

class _SingleDateViewPageState extends ConsumerState<SingleDateViewPage> {
  late DateTime startDate;
  late DateTime endDate;
  late int pageIndex;

  late PageController _controller;

  void initPageIndex() {
    pageIndex = widget.date.difference(startDate).inDays.abs();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDate = AppSettings.calendarStartDate;
    endDate = AppSettings.calendarEndDate;
    initPageIndex();
    _controller = PageController(initialPage: pageIndex);
  }

  Widget _buildSingleDatePageView(double height, double width) {
    final numOfTotalDays = startDate.difference(endDate).inDays.abs();

    return Positioned(
      bottom: 0,
      child: Container(
        height: height,
        width: width,
        child: PageView.builder(
          controller: _controller,
          itemCount: numOfTotalDays,
          allowImplicitScrolling: true,
          itemBuilder: (context, index) {
            final date = DateTime(startDate.year, startDate.month, startDate.day + index);
            final dateString = "${date.year}-${date.month}-${date.day}";
            return SingleDatePageViewContent(
              date: date,
              dateString: dateString,
              height: height,
              width: width,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/background/background-sky.jpg",
                fit: BoxFit.fitHeight,
                alignment: Alignment(1, 1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  _buildSingleDatePageView(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleDatePageViewContent extends ConsumerWidget {
  const SingleDatePageViewContent({
    super.key,
    required this.date,
    required this.dateString,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final DateTime date;
  final String dateString;

  Widget _buildEventsDetail(
    double width,
    DateDetailStructured? dateDetailStructured,
  ) {
    if (dateDetailStructured == null) return SizedBox();
    // List<Event?> sortedEvents = [...dateDetailStructured.events];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 520,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Stack(children: [
        Positioned(
          top: 0,
          child: _buildMultidayEventBookmark(width, dateDetailStructured),
        ),
        Positioned(
          bottom: 0,
          child: _buildEventsListView(width, dateDetailStructured),
        ),
      ]),
    );
  }

  Widget _buildMultidayEventBookmark(double width, DateDetailStructured dateDetailStructured) {
    return Container(
      height: 80,
      width: width,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 8),
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 4,
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dateDetailStructured.multidayEvents.length,
        itemBuilder: (context, index) {
          final mEvent = dateDetailStructured.multidayEvents[index];
          if (mEvent == null) return const SizedBox();
          return SingleDateMultidayEventBookMark(
            width: width,
            mEvent: mEvent,
          );
        },
      ),
    );
  }

  Container _buildEventsListView(double width, DateDetailStructured dateDetailStructured) {
    return Container(
      height: 440,
      width: width - 20,
      child: ListView.builder(
        itemCount: dateDetailStructured.events.length,
        itemBuilder: (context, index) {
          if (dateDetailStructured.events[index] == null) return SizedBox();
          MultidayEvent? multidayEvent;
          for (int i = 0; i < dateDetailStructured.multidayEvents.length; i++) {
            if (dateDetailStructured.multidayEvents[i]!.id == dateDetailStructured.events[index]!.multidayEventId) {
              multidayEvent = dateDetailStructured.multidayEvents[i];
              break;
            }
          }
          return SingleDateEventListTile(
            date: date,
            event: dateDetailStructured.events[index],
            multidayEvent: multidayEvent,
          );
        },
      ),
    );
  }

  Widget _buildInfoHeader(double width, DateTime date, DateDetailStructured? dateDetailStructured) {
    return Container(
      height: 100,
      width: width,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${CustomDateString.weekdayShort[date.weekday - 1]}",
                  style: FontSettings.primaryFont.copyWith(fontSize: 20),
                ),
                Text(
                  "${date.day.toString()} ${CustomDateString.monthsShort[date.month - 1]}",
                  style: FontSettings.secondaryFont.copyWith(fontSize: 40),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  date.year.toString(),
                  style: FontSettings.secondaryFont.copyWith(fontSize: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateDetailStructuredWatcher = ref.watch(dateDetailStructuredWatcherProvider(dateString: dateString));
    return dateDetailStructuredWatcher.when(
      data: (dateDetailStructured) {
        List<Event?> events = [];
        List<MultidayEvent?> multidayEvents = [];
        if (dateDetailStructured != null) {
          events = dateDetailStructured.events;
          multidayEvents = dateDetailStructured.multidayEvents;
        }

        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: _buildEventsDetail(
                    MediaQuery.of(context).size.width,
                    dateDetailStructured,
                  ),
                ),
                Positioned(
                  bottom: 520,
                  child: _buildInfoHeader(
                    MediaQuery.of(context).size.width,
                    date,
                    dateDetailStructured,
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: SingleDateLocationWeatherInfo(
                    date: date,
                    events: events,
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
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

class SingleDateMultidayEventBookMark extends ConsumerWidget {
  const SingleDateMultidayEventBookMark({
    super.key,
    required this.width,
    required this.mEvent,
  });

  final double width;
  final MultidayEvent? mEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        if (mEvent == null) return const SizedBox();
        final multidayEventId = mEvent!.id;
        final multidayEventWatcher =
            ref.watch(multidayEventStructuredWatcherProvider(multidayEventId: multidayEventId));

        return multidayEventWatcher.when(
          data: (data) {
            if (data == null) return SizedBox();
            final MultidayEventDetailProp mProp = data.mEventDetailProp;
            final List<MultidayEventDateListProp> mList = data.mEventDateListProps;
            return Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  ref.watch(multidayEventDetailProvider.notifier).setMultidayEventDetailProp(mProp);
                  ref.watch(multidayEventDateListProvider.notifier).setMultidayEventDateListPropList(mList);
                  context.go("/multidayEventEdit");
                  // print(dateDetailStructured.);
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(4),
                  height: 80,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(mEvent!.bookmarkColorInt),
                    border: Border.all(width: 1, color: Colors.white54),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 0),
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.outer), //BoxShadow
                    ],
                    // borderRadius: BorderRadius.circular(4),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final sticker = ref.watch(fetchStickerByIdProvider(stickerId: mEvent!.bookmarkStickerId));
                      return sticker.when(
                        data: (data) {
                          if (data == null) return SizedBox();
                          final image = base64.decode(data.imageBase64);
                          return Image.memory(
                            image,
                            gaplessPlayback: true,
                          );
                        },
                        error: (error, stackTrace) {
                          return SizedBox();
                        },
                        loading: () {
                          return SizedBox();
                        },
                      );
                    },
                  ),
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
      },
    );
    ;
  }
}

class SingleDateLocationWeatherInfo extends ConsumerWidget {
  const SingleDateLocationWeatherInfo({
    super.key,
    required this.date,
    required this.events,
  });

  final DateTime date;
  final List<Event?> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    Event? currentEvent;
    for (int i = 0; i < events.length; i++) {
      final start = events[i]!.startHourMinute;
      final end = events[i]!.endHourMinute;
      final eventStartTime = DateTime(date.year, date.month, date.day, start[0], start[1]);
      final eventEndTime = DateTime(date.year, date.month, date.day, end[0], end[1]);

      if (eventStartTime.isBefore(now) && eventEndTime.isAfter(now)) {
        currentEvent = events[i];
        break;
      }
    }

    String location = "--";
    String weather = "--";

    if (currentEvent == null) {
      return Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Material(
              clipBehavior: Clip.none,
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text("$location - $weather", style: FontSettings.primaryFont),
        ],
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        int eventId = currentEvent!.id;
        final eventWatch = ref.watch(eventWatcherProvider(eventIds: eventId));

        return eventWatch.when(
          data: (data) {
            if (data == null) return Text("$location - $weather", style: FontSettings.primaryFont);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    clipBehavior: Clip.none,
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () async {
                        print("Hello");
                        if (data == null) return;
                        await OpenWeatherService().updateWeatherByEventId(data.id);
                        // if (data.latlng != null) {
                        //   // print(weather);
                        // }
                      },
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                  ),
                ),
                data.weatherLastUpdate != null
                    ? Text(
                        "Last Update: ${data.weatherLastUpdate!.hour}:${data.weatherLastUpdate!.minute}:${data.weatherLastUpdate!.second}",
                        style: FontSettings.primaryFont)
                    : const SizedBox(),
                Text("${data.location} - ${data.weather} - ${data.temperature}°C", style: FontSettings.primaryFont),
              ],
            );
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
  }
}

class SingleDateEventListTile extends ConsumerWidget {
  const SingleDateEventListTile({
    super.key,
    required this.date,
    required this.event,
    required this.multidayEvent,
  });

  final DateTime date;
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
    final startTime = DateTime(date.year, date.month, date.day, event!.startHourMinute[0], event!.startHourMinute[1]);
    final endTime = DateTime(date.year, date.month, date.day, event!.endHourMinute[0], event!.endHourMinute[1]);
    final now = DateTime.now();

    return Opacity(
      opacity: now.isAfter(endTime) ? 0.25 : 1,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 96,
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
