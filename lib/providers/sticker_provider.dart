import 'package:fyp_our_sky_new/services/sticker_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/sticker.dart';

part 'sticker_provider.g.dart';

@riverpod
Future<List<Sticker>> fetchStickers(FetchStickersRef ref) async {
  final stickerService = StickerService();
  final stickers = stickerService.getAllStickers();
  return stickers;
}

@riverpod
Future<Sticker?> fetchStickerById(FetchStickerByIdRef ref, {required String stickerId}) async {
  final stickerService = StickerService();
  final sticker = stickerService.getStickerById(stickerId);
  return sticker;
}
