import 'package:fyp_our_sky_new/providers/checklist_temp_prop.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checklist_items_edit_notifier.g.dart';

@riverpod
class ChecklistItemsEdit extends _$ChecklistItemsEdit {
  @override
  ChecklistTemp build() {
    return ChecklistTemp(
      id: Isar.autoIncrement,
      title: "",
      items: [],
    );
  }

  void initChecklist() {
    state = ChecklistTemp(
      id: Isar.autoIncrement,
      title: "",
      items: [],
    );
  }

  void setChecklistTemp(ChecklistTemp checklistTemp) {
    state = checklistTemp;
  }

  void setChecklistTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setChecklistItems(List<ChecklistItemTemp> checklistItems) {
    state = state.copyWith(items: checklistItems);
  }

  void addChecklistItem(ChecklistItemTemp checklistItem) {
    state = state.copyWith(items: [...state.items, checklistItem]);
  }

  void removeChecklistItemAtIndex(int index) {
    List<ChecklistItemTemp> tempList = [...state.items];
    tempList.removeAt(index);
    state = state.copyWith(items: tempList);
  }

  void updateChecklistItemDetailByIndex(int index, String detail) {
    List<ChecklistItemTemp> tempList = [...state.items];
    tempList[index] = tempList[index].copyWith(detail: detail);
    state = state.copyWith(items: tempList);
  }
  // void
}
