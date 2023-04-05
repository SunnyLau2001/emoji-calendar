import 'dart:convert';
import 'dart:ui';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/sticker_provider.dart';
import 'package:fyp_our_sky_new/utils/date_string.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

import '../models/sticker.dart';
import 'edit_bookmark_dialog.dart';

class MultidayEventDetailDialog extends ConsumerStatefulWidget {
  const MultidayEventDetailDialog({super.key});

  @override
  ConsumerState<MultidayEventDetailDialog> createState() => _MultidayEventDetailDialogState();
}

class _MultidayEventDetailDialogState extends ConsumerState<MultidayEventDetailDialog> {
  late TextEditingController _controller;
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    dialogSelectColor = const Color(0xFFA239CA);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Widget _buildDateRangeField(List<DateTime> dateRange) {
    final dateRangeCell = dateRange.map((date) {
      return Container(
        padding: EdgeInsets.all(8),
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white24),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              CustomDateString.monthsShort[date.month - 1],
              style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
            ),
            Text(
              date.day.toString(),
              style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 16),
            ),
            Text(
              CustomDateString.weekdayShort[date.weekday - 1],
              style: FontSettings.primaryFont.copyWith(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      );
    }).toList();

    if (dateRange.length == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...dateRangeCell],
      );
    }

    if (dateRange.length == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dateRangeCell[0],
          SizedBox(width: 10),
          Text(
            "TO",
            style: FontSettings.primaryFont.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          dateRangeCell[1],
        ],
      );
    }

    return Container();
  }

  Widget _buildTitleField(String title) {
    _controller.text = title;
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
        ref.read(multidayEventDetailProvider.notifier).setTitle(value);
      },
    );
  }

  Widget _buildBookmarkStickerField() {
    return Consumer(
      builder: (context, ref, child) {
        final colorInt = ref.watch(multidayEventDetailProvider).bookmarkColorInt;
        final stickerId = ref.watch(multidayEventDetailProvider).bookmarkStickerId;
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
                        child: Image.memory(image),
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

  Widget _buildBookmarkColorField(BuildContext context, int color) {
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
            final color = await showColorPickerDialog(
              context,
              dialogSelectColor,
              backgroundColor: Colors.white,
              dialogElevation: 0,
              borderRadius: 4,
              elevation: 0,
            );
            ref.read(multidayEventDetailProvider.notifier).setBookmarkStickerColor(color.value);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white60),
                  color: color == -1 ? Colors.white : Color(color),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Color",
                style: FontSettings.primaryFont.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateRange = ref.watch(multidayEventDetailProvider).dateRange;
    final title = ref.watch(multidayEventDetailProvider).title;

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
                  _buildDateRangeField(dateRange),
                  SizedBox(height: 10),
                  _buildTitleField(title),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, child) {
                      return _buildBookmarkStickerField();
                    },
                  ),
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
Future setMultidayEventEventDetail({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return MultidayEventDetailDialog();
    },
  );
}