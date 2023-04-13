import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/providers/sticker_provider.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';
import 'package:go_router/go_router.dart';

import '../models/sticker.dart';
import 'edit_bookmark_dialog.dart';

class MultidayEventDetailDialog extends ConsumerStatefulWidget {
  const MultidayEventDetailDialog({
    super.key,
    this.mode = "create",
    this.title = "Title",
  });
  final String title;
  final String mode;

  @override
  ConsumerState<MultidayEventDetailDialog> createState() => _MultidayEventDetailDialogState();
}

class _MultidayEventDetailDialogState extends ConsumerState<MultidayEventDetailDialog> {
  late TextEditingController _controller;
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.title,
    );
    dialogSelectColor = Colors.white;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Widget _buildDateRangeField(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return SizedBox();
    // print(startDate == endDate)

    if (startDate == endDate) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white24),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  CustomDateString.monthsShort[startDate.month - 1],
                  style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
                ),
                Text(
                  startDate.day.toString(),
                  style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 16),
                ),
                Text(
                  CustomDateString.weekdayShort[startDate.weekday - 1],
                  style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white24),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                CustomDateString.monthsShort[startDate.month - 1],
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
              ),
              Text(
                startDate.day.toString(),
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 16),
              ),
              Text(
                CustomDateString.weekdayShort[startDate.weekday - 1],
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "TO",
          style: FontSettings.primaryFont,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white24),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                CustomDateString.monthsShort[endDate.month - 1],
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
              ),
              Text(
                endDate.day.toString(),
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 16),
              ),
              Text(
                CustomDateString.weekdayShort[endDate.weekday - 1],
                style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
    // return SizedBox();
  }

  Widget _buildTitleField(String title) {
    // _controller.text = title;
    return TextField(
      controller: _controller,
      style: TextStyle(color: Colors.white),
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
      onChanged: (value) {
        // ref.read(multidayEventDetailProvider.notifier).setTitle(value);
      },
    );
  }

  Widget _buildBookmarkStickerField() {
    return Consumer(
      builder: (context, ref, child) {
        final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
        final colorInt = mEventTemp.bookmarkColorInt;
        final stickerId = mEventTemp.bookmarkStickerId;
        AsyncValue<Sticker?> sticker = ref.watch(fetchStickerByIdProvider(stickerId: stickerId));

        return Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white24),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () async {
                final color = await editBookmark(context: context);
                if (color != null) {
                  // ref.read(multidayEventDetailProvider.notifier).setStickerColor(color.value);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sticker.when(
                    data: (data) {
                      final image = base64.decode(data!.imageBase64);
                      return Container(
                        padding: EdgeInsets.all(8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white60),
                          color: Color(colorInt),
                          shape: BoxShape.circle,
                        ),
                        child: Image.memory(
                          image,
                          gaplessPlayback: true,
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
                      );
                    },
                    loading: () {
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white60),
                          // color: Color(colorInt),
                          shape: BoxShape.circle,
                        ),
                        child: const CircularProgressIndicator(
                          color: Colors.white60,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Edit Bookmark",
                    style: FontSettings.primaryFont.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
                  ref.watch(multidayEventDetailProvider.notifier).setTitle(_controller.text);
                  if (widget.mode == "create") {
                    print("Create");
                    ref.watch(multidayEventDetailProvider.notifier).initMultidayEventDetailProp();
                    ref.watch(multidayEventDetailProvider.notifier).setDateList();
                    ref.watch(isSelectingDateRangeProvider.notifier).state = false;
                    context.go('/multidayEventEdit');
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
    // final dateRange = ref.watch(multidayEventDetailProvider).dateRange;
    final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
    final startDate = mEventTemp.startDate;
    final endDate = mEventTemp.endDate;
    final title = mEventTemp.title;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(width: 1, color: Colors.white54),
                borderRadius: BorderRadius.circular(8),
              ),
              // color: Colors.transparent,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  _buildDateRangeField(startDate, endDate),
                  SizedBox(height: 10),
                  _buildTitleField(title),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, child) {
                      return _buildBookmarkStickerField();
                    },
                  ),
                  SizedBox(height: 10),
                  _buildActionButton(),
                ],
              ),
            ),
            // Book mark
          ],
        ),
      ),
    );
  }
}

//
Future<void> createMultidayEventEventDetail({
  required BuildContext context,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return MultidayEventDetailDialog();
    },
  );
}

Future<void> editMultidayEventEventDetail({
  required BuildContext context,
  required String title,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return MultidayEventDetailDialog(
        mode: "edit",
        title: title,
      );
    },
  );
}
