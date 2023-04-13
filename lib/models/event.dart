import 'package:isar/isar.dart';

part 'event.g.dart';

@collection
class Event {
  late Id id;
  late String title;
  late List<int> startHourMinute;
  late List<int> endHourMinute;
  String? stickerId;
  String? location;
  List<double>? latlng;
  String? weather;
  double? temperature;
  DateTime? weatherLastUpdate;

  int? checklistId;
  late int multidayEventId;
  late String dateId;
}
