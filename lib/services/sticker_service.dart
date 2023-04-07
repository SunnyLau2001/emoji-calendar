import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fyp_our_sky_new/services/isar_service.dart';
import 'package:fyp_our_sky_new/utils/util_functions.dart';
import 'package:isar/isar.dart';

import '../models/sticker.dart';

class StickerService {
  late Future<Isar> isar;

  StickerService() {
    isar = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      await IsarService.initIsar();
    }
    return Future.value(Isar.getInstance());
  }

  static Future<void> initSticker() async {
    final String response = await rootBundle.loadString('assets/images/stickers/sticker_data.json');
    Map<String, dynamic> parsed = jsonDecode(response);

    final db = await StickerService().openIsar();
    List<Sticker> stickerList = [];
    List<dynamic> stickerMap = parsed['sticker'];
    stickerMap.forEach((sticker) async {
      // path of image
      String imagePath = "assets/images/stickers/" + sticker['filename'];

      // convert image into file oject
      ByteData imageFile = await rootBundle.load(imagePath);

      Uint8List imageUint8 = imageFile.buffer.asUint8List();

      // base64 encode the bytes
      String base64String = base64.encode(imageUint8);

      final stickerEntity = Sticker()
        ..id = sticker['stringId']
        ..type = "default"
        ..tag = sticker['mainTag']
        ..imageBase64 = base64.normalize(base64String);
      stickerList.add(stickerEntity);
    });
    db.writeTxn(() async {
      await db.stickers.putAll(stickerList);
    });
  }

  Future<List<Sticker>> getAllStickers() async {
    final db = await isar;
    final stickerList = db.stickers.where().findAll();
    return stickerList;
  }

  Future<Sticker?> getStickerById(String stringId) async {
    final db = await isar;
    final sticker = db.stickers.get(UtilFunctions.fastHash(stringId));
    return sticker;
  }
}
