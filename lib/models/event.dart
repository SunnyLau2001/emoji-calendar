import 'package:isar/isar.dart';

part 'event.g.dart';

@collection
class Event {
  Id id = Isar.autoIncrement;
  late String title;
  late List<int> startHourMinute;
  late List<int> endHourMinute;
  late String stickerId;
  String? location;
  List<double>? latlng;
  String? weather;
  double? temperature;
  DateTime? weatherLastUpdate;

  int? checklistId;
  late int multidayEventId;
  late String dateId;
}
