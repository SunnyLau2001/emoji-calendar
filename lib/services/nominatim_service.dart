import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/address_detail.dart';

class NominatimService {
  static Future<List<AddressDetail>> getAddressDetail(String address) async {
    var url = Uri.https("nominatim.openstreetmap.org", "/search",
        {"q": "${address.replaceAll(RegExp(' '), '+')}", "format": "geocodejson"});
    // print(url);
    await Future.delayed(const Duration(seconds: 1));

    var response = await http.get(url);
    // print('Response body: ${response.body}');
    final json = jsonDecode(response.body);
    List<dynamic> features = json['features'];
    print(features);
    return features.map<AddressDetail>((feature) => AddressDetail.fromJson(feature)).toList();
  }
}
