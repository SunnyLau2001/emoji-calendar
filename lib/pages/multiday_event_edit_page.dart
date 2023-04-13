import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_date_list_notifier.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/put_multiday_event_notifier.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

import '../components/date_list_drag_target.dart';
import '../components/multiday_event_detail_dialog.dart';
import '../models/sticker.dart';
import '../providers/providers.dart';
import '../providers/sticker_provider.dart';

class MultidayEventEditPage extends ConsumerStatefulWidget {
  const MultidayEventEditPage({super.key});

  @override
  ConsumerState<MultidayEventEditPage> createState() => _MultidayEventEditPage();
}

class _MultidayEventEditPage extends ConsumerState<MultidayEventEditPage> {
  // Setup the auto scrolling when stick drag to the edge of the list
  final _listViewKey = GlobalKey();
  final ScrollController _listviewScroller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _listviewScroller.dispose();
  }

  Widget _buildTopBar() {
    return const MultidayEventEditTopBar();
  }

  Widget _buildDateEventsList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 150,
      child: DateEventsList(
        listviewScroller: _listviewScroller,
        listviewKey: _listViewKey,
      ),
    );
  }

  Widget _buildDraggableStickerPicker() {
    return const SizedBox(
      height: 150,
      child: DraggableStickerPicker(),
    );
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
              alignment: Alignment(0, 1),
            ),
          ),
          AutoScrollPanListener(
            scroller: _listviewScroller,
            panKey: _listViewKey,
            passingChild: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(child: _buildDateEventsList()),
                    Positioned(
                      bottom: 0,
                      child: _buildDraggableStickerPicker(),
                    ),
                    Positioned(child: _buildTopBar()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AutoScrollPanListener extends ConsumerWidget {
  AutoScrollPanListener({
    super.key,
    required this.passingChild,
    required this.panKey,
    required this.scroller,
  });

  final GlobalKey panKey;
  final ScrollController scroller;
  final Widget passingChild;
  bool _isScrolling = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      child: passingChild,
      onPointerUp: (event) {
        if (_isScrolling) {
          _isScrolling = false;
          scroller.jumpTo(scroller.offset);
        }
        return;
      },
      onPointerMove: (PointerMoveEvent event) {
        final isDragging = ref.watch(isDraggingStickerProvider);
        if (!isDragging) {
          return;
        }
        // print("x: ${event.position.dx}, y: ${event.position.dy}");
        RenderBox render = panKey.currentContext?.findRenderObject() as RenderBox;
        Offset position = render.localToGlobal(Offset.zero);
        double topY = position.dy + 200;
        double bottomY = topY + render.size.height - 200;

        // Range to detect where the list start scroll
        if (event.position.dy <= bottomY && event.position.dy >= topY && _isScrolling) {
          _isScrolling = false;
          scroller.jumpTo(scroller.offset);
        }
        if (event.position.dy < topY && !_isScrolling) {
          int velocity = ((scroller.position.maxScrollExtent - scroller.offset + 1) * 1.5).toInt();
          if (velocity <= 0) velocity = 1;

          _isScrolling = true;
          scroller.animateTo(scroller.position.maxScrollExtent,
              curve: Curves.easeInOut, duration: Duration(milliseconds: velocity));
        }
        if (event.position.dy > bottomY && !_isScrolling) {
          int velocity = ((scroller.offset + 1) * 1.5).toInt();
          if (velocity <= 0) velocity = 1;

          _isScrolling = true;
          scroller.animateTo(0, curve: Curves.easeInOut, duration: Duration(milliseconds: velocity));
        }
      },
    );
  }
}

class MultidayEventEditTopBar extends ConsumerWidget {
  const MultidayEventEditTopBar({super.key});

  List<Widget> _buildSelectableDateList(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return [const SizedBox()];

    if (startDate == endDate) return [SelectableDateCell(date: startDate)];

    List<Widget> selectableDateList = [];

    int step = startDate.difference(endDate).inDays.abs();

    for (int i = 0; i < step + 1; i++) {
      final date = DateTime(startDate.year, startDate.month, startDate.day + i);
      selectableDateList.add(SelectableDateCell(date: date));
    }

    return selectableDateList;
  }

  Widget _buildBookmarkSticker(String stickerId, int colorInt) {
    return Consumer(
      builder: (context, ref, child) {
        AsyncValue<Sticker?> sticker = ref.watch(fetchStickerByIdProvider(stickerId: stickerId));

        return sticker.when(
          data: (data) {
            final image = base64.decode(data!.imageBase64);
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white54),
                color: Color(colorInt),
                // shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(4),
              child: Image.memory(
                image,
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
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
    final startDate = mEventTemp.startDate;
    final endDate = mEventTemp.endDate;

    final title = mEventTemp.title;
    final stickerId = mEventTemp.bookmarkStickerId;
    final colorInt = mEventTemp.bookmarkColorInt;

    // final dateRange = multidayEventDetail.dateRange;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: InkWell(
          onTap: () async {
            await editMultidayEventEventDetail(context: context, title: mEventTemp.title);
          },
          child: Container(
            height: 182,
            decoration: BoxDecoration(
                // color: Colors.white54,
                border: Border.all(
                  width: 1,
                  color: Colors.white54,
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          ref.watch(isSelectingDateRangeProvider.notifier).state = false;
                          ref.read(putMultidayEventProvider.notifier).putMultidayEventToDB();
                          // ref.watch(multidayEventDateListProvider.notifier).putMultidayEvents();
                        },
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 58 - 20,
                          child: Text(
                            title,
                            style: FontSettings.primaryFont.copyWith(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: _buildBookmarkSticker(stickerId, colorInt),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    padding: EdgeInsets.only(right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: _buildSelectableDateList(startDate, endDate),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectableDateCell extends ConsumerWidget {
  SelectableDateCell({
    super.key,
    required this.date,
  });
  final DateTime date;

  final _monthNames = CustomDateString.monthsShort;
  final _weekdayNames = CustomDateString.weekdayShort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String dateString = "${date.year}-${date.month}-${date.day}";
    final focusedDate = ref.watch(focusedDateEventsListProvider);
    // final current = false;

    return InkWell(
      onTap: () {
        // int current = ref.watch(dayEventListFocusProvider);

        if (focusedDate == dateString) {
          ref.read(focusedDateEventsListProvider.notifier).state = '';
        } else {
          ref.read(focusedDateEventsListProvider.notifier).state = dateString;
        }
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: focusedDate == dateString ? 1 : 0.8,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
          height: 80,
          width: 52,
          // alignment: Alignment.center,
          margin: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: focusedDate == dateString ? Colors.white54 : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white10,
            boxShadow: [
              BoxShadow(
                  color: focusedDate == dateString ? Colors.white54 : Colors.transparent,
                  offset: const Offset(
                    0,
                    0,
                  ),
                  blurRadius: 5.0,
                  // spreadRadius: 0,
                  blurStyle: BlurStyle.outer), //BoxShadow
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_monthNames[date.month - 1], style: FontSettings.primaryFont.copyWith(fontSize: 10)),
              Text(date.day.toString(), style: FontSettings.primaryFont),
              Text(_weekdayNames[date.weekday - 1], style: FontSettings.primaryFont.copyWith(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}

class DateEventsList extends ConsumerWidget {
  const DateEventsList({
    super.key,
    required this.listviewScroller,
    required this.listviewKey,
  });

  final ScrollController listviewScroller;
  final GlobalKey listviewKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final dateRange = ref.watch(multidayEventDetailProvider).dateRange;

    return Consumer(
      builder: (context, ref, child) {
        final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
        DateTime? startDate = mEventTemp.startDate;
        final dateList = ref.watch(multidayEventDateListProvider);

        startDate = startDate ?? DateTime.now();
        int year = startDate.year;
        int month = startDate.month;
        int day = startDate.day;

        return Container(
          child: ListView.builder(
            controller: listviewScroller,
            key: listviewKey,
            physics: const ClampingScrollPhysics(),
            reverse: true,
            padding: EdgeInsets.only(top: 182 + MediaQuery.of(context).padding.top),
            itemCount: dateList.length,
            itemBuilder: (context, index) {
              return DateListDragTarget(
                date: DateTime(year, month, day + (dateList.length - index - 1)),
                dateIndex: dateList.length - index - 1,
              );
            },
          ),
        );
      },
    );
  }
}

class DraggableStickerPicker extends ConsumerWidget {
  const DraggableStickerPicker({
    super.key,
  });

  Widget _buildStickerGrid(List<Sticker> stickers, double width) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: stickers.length,
      itemBuilder: (context, index) {
        return DraggableStickerPickerCell(sticker: stickers[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Sticker>> stickers = ref.watch(fetchStickersProvider);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 150,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white54,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: stickers.when(
            data: (data) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return _buildStickerGrid(data, constraints.maxWidth);
                },
              );
            },
            error: (error, stackTrace) {
              return Container();
            },
            loading: () {
              return CircularProgressIndicator(
                color: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}

class DraggableStickerPickerCell extends ConsumerWidget {
  const DraggableStickerPickerCell({
    super.key,
    required this.sticker,
  });

  final Sticker sticker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = base64.decode(sticker.imageBase64);
    return LongPressDraggable(
      data: sticker,
      onDragStarted: () {
        ref.read(isDraggingStickerProvider.notifier).state = true;
      },
      onDragEnd: (_) {
        ref.read(isDraggingStickerProvider.notifier).state = false;
        ref.read(activedDummyTargetIndexProvider.notifier).state = -1;
      },
      onDraggableCanceled: (velocity, offset) {
        ref.read(isDraggingStickerProvider.notifier).state = false;
        ref.read(activedDummyTargetIndexProvider.notifier).state = -1;
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(
                width: 1,
                color: Colors.white10,
              ),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                    color: Colors.transparent,
                    offset: const Offset(
                      0,
                      0,
                    ),
                    blurRadius: 5.0,
                    // spreadRadius: 0,
                    blurStyle: BlurStyle.outer), //BoxShadow
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Image.memory(image),
          ),
        ],
      ),
      childWhenDragging: Container(),
      feedback: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTextStyle(
            child: Text(sticker.tag),
            style: FontSettings.primaryFont.copyWith(fontSize: 14),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border.all(
                      width: 1,
                      color: Colors.white10,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.transparent,
                          offset: const Offset(
                            0,
                            0,
                          ),
                          blurRadius: 5.0,
                          // spreadRadius: 0,
                          blurStyle: BlurStyle.outer), //BoxShadow
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.memory(image),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
