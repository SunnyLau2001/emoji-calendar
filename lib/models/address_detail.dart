class AddressDetail {
  final String name;
  final String label;
  final double? lon;
  final double? lat;

  const AddressDetail({
    required this.name,
    required this.label,
    this.lon,
    this.lat,
  });

  factory AddressDetail.fromJson(Map<String, dynamic> json) {
    return AddressDetail(
      name: json['properties']['geocoding']['name'] as String,
      label: json['properties']['geocoding']['label'] as String,
      lon: json['geometry']['coordinates'][0] as double,
      lat: json['geometry']['coordinates'][1] as double,
    );
  }
}
