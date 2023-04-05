import 'package:fyp_our_sky_new/utils/util_functions.dart';
import 'package:isar/isar.dart';

part 'sticker.g.dart';

@collection
class Sticker {
  late String id;
  Id get isarId => UtilFunctions.fastHash(id);
  late String type;
  late String tag;
  late String imageBase64;
}
