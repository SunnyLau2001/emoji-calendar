import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/address_detail.dart';
import '../services/nominatim_service.dart';

part 'address_suggestions_notifier.g.dart';

@riverpod
class AddressSuggestions extends _$AddressSuggestions {
  List<AddressDetail> temp = [];

  @override
  Future<List<AddressDetail>> build() {
    return Future.value([]);
  }

  Future<void> initSuggestions() async {
    state = await AsyncValue.guard(() async {
      return [];
    });
  }

  Future<void> searchSuggestions({String q = ""}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      temp = await NominatimService.getAddressDetail(q);
      return temp;
    });
  }
}
