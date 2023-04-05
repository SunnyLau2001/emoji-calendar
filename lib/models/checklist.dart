
import 'package:isar/isar.dart';

part 'checklist.g.dart';

@collection
class Checklist {
  Id id = Isar.autoIncrement;
  late int eventId;
  List<ChecklistItem>? checklist;

}

@embedded
class ChecklistItem {
  late String title;
  late bool checked = false;
}