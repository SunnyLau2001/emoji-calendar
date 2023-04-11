import 'package:fyp_our_sky_new/utils/util_functions.dart';
import 'package:isar/isar.dart';

part 'date_detail.g.dart';

@collection
class DateDetail {
  late String date;
  Id get isarId => UtilFunctions.fastHash(date);
  late DateTime lastUpdate;

  List<int> availableTracks = [-1, -1, -1];
  List<int> eventsId = [];
  List<int> multidayEventsId = [];
}
