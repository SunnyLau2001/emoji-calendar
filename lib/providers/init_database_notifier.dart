import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'init_database_notifier.g.dart';

@riverpod
class InitDatabase extends _$InitDatabase {
  @override
  void build() {
    return;
  }

  Future<void> initMultidayEventDatabase() async {
    await MultidayEventService().initDatabase();
  }
}
