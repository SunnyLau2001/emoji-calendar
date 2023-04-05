import 'package:fyp_our_sky_new/models/checklist.dart';
import 'package:fyp_our_sky_new/models/date_detail.dart';
import 'package:fyp_our_sky_new/models/event.dart';
import 'package:fyp_our_sky_new/models/multiday_event.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/sticker.dart';

class IsarService {
  static Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    await Isar.open(
      [StickerSchema, DateDetailSchema, MultidayEventSchema, EventSchema, ChecklistSchema],
      inspector: true,
      directory: dir.path,
    );
  }
}
