import 'package:fyp_our_sky_new/services/multiday_event_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/checklist.dart';

part 'put_checklist_notifier.g.dart';

@riverpod
class PutChecklist extends _$PutChecklist {
  @override
  void build() {
    return;
  }

  Future<void> putChecklistToDB(Checklist? checklist, int eventId) async {
    if (checklist == null) return;

    await MultidayEventService().putChecklistToDB(checklist, eventId);

    // final result = ref.watch(multidayEventDateListProvider);
    // final mEventDateLists = [...result];
    // if (mEventDateLists.isEmpty) return;
    // final mEventDetailProp = ref.watch(multidayEventDetailProvider);

    // await MultidayEventService().putMultidayEvents(mEventDetailProp, mEventDateLists);

    // ref.watch(multidayEventDateListProvider.notifier).initMultidayEventDateList();
    // initMultidayEventDetailProp;

    // print(mEventDetailProps);
  }
}
