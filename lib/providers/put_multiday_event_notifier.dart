import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/multiday_event_service.dart';
import 'multiday_event_date_list_notifier.dart';

part 'put_multiday_event_notifier.g.dart';

@riverpod
class PutMultidayEvent extends _$PutMultidayEvent {
  @override
  void build() {
    return;
  }

  void putMultidayEventToDB() async {
    final result = ref.watch(multidayEventDateListProvider);
    final mEventDateLists = [...result];
    if (mEventDateLists.isEmpty) return;
    final mEventDetailProp = ref.watch(multidayEventDetailProvider);

    await MultidayEventService().putMultidayEvents(mEventDetailProp, mEventDateLists);

    // ref.watch(multidayEventDateListProvider.notifier).initMultidayEventDateList();
    // initMultidayEventDetailProp;

    // print(mEventDetailProps);
  }
}
