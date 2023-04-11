import 'package:isar/isar.dart';

part 'checklist.g.dart';

@collection
class Checklist {
  Id id = Isar.autoIncrement;
  late String title;
  List<ChecklistItem> checklist = [];
  int? eventId;
}

@embedded
class ChecklistItem {
  late String detail;
  late bool checked = false;
}
