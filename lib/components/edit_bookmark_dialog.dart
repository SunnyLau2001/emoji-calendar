import 'dart:convert';
import 'dart:ui';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/sticker.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/sticker_provider.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

class EditBookmarkDialog extends ConsumerWidget {
  const EditBookmarkDialog({super.key});

  Widget _buildStickerPicker() {
    return const BookmarkStickerPicker();
  }

  Widget _buildColorPicker(WidgetRef ref) {
    // final dialogPickerColor = Colors.blue;
    final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
    final dialogPickerColor = mEventTemp.bookmarkColorInt;
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: Color(dialogPickerColor),
      pickerTypeTextStyle: FontSettings.primaryFont,
      selectedPickerTypeColor: Colors.black12,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) {
        ref.read(multidayEventDetailProvider.notifier).setBookmarkStickerColor(color.value);
      },
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      padding: EdgeInsets.all(10),
      // heading: Text(
      //   'Select color',
      //   style: FontSettings.primaryFont,
      // ),
      subheading: Text(
        'Select color shade',
        style: FontSettings.primaryFont,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: FontSettings.primaryFont,
      ),
      // showMaterialName: true,
      // showColorName: true,
      // showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: FontSettings.primaryFont,
      colorNameTextStyle: FontSettings.primaryFont,
      colorCodeTextStyle: FontSettings.primaryFont,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },

      // customColorSwatchesAndNames: colorsNameMap,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(width: 1, color: Colors.white54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildColorPicker(ref),
                _buildStickerPicker(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarkStickerPicker extends ConsumerWidget {
  const BookmarkStickerPicker({super.key});

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
        return BookmarkStickerPickerCell(sticker: stickers[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Sticker>> stickers = ref.watch(fetchStickersProvider);

    return stickers.when(
      data: (data) {
        return Container(
          padding: EdgeInsets.all(10),
          height: 200,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return _buildStickerGrid(data, constraints.maxWidth);
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () {
        return Container(
          alignment: Alignment.center,
          height: 200,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class BookmarkStickerPickerCell extends ConsumerWidget {
  const BookmarkStickerPickerCell({
    super.key,
    required this.sticker,
  });

  final Sticker sticker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = base64.decode(sticker.imageBase64);
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () {
        ref.read(multidayEventDetailProvider.notifier).setBookmarkStickerId(sticker.id);
      },
      child: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final mEventTemp = ref.watch(multidayEventDetailProvider).multidayEventTemp;
              final isSelected = mEventTemp.bookmarkStickerId == sticker.id;
              return AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white54 : Colors.white10,
                  border: Border.all(
                    width: 1,
                    color: isSelected ? Colors.white54 : Colors.white10,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: isSelected ? Colors.white54 : Colors.transparent,
                        offset: const Offset(
                          0,
                          0,
                        ),
                        blurRadius: 5.0,
                        // spreadRadius: 0,
                        blurStyle: BlurStyle.outer), //BoxShadow
                  ],
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Image.memory(image),
          ),
        ],
      ),
    );
  }
}

Future editBookmark({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return const EditBookmarkDialog();
    },
  );
}
