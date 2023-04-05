import 'package:isar/isar.dart';

part 'multiday_event.g.dart';

@collection
class MultidayEvent {
  Id id = Isar.autoIncrement;
  late String title;
  late String startDate;
  late String endDate;
  late String bookmarkStickerId;
  late int bookmarkColorInt;

  List<int> eventsId = [];
}
