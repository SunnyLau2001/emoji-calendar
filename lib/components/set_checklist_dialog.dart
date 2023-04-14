import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/checklist.dart';
import 'package:fyp_our_sky_new/providers/checklist_items_edit_notifier.dart';
import 'package:fyp_our_sky_new/providers/checklist_temp_prop.dart';

import '../utils/font_settings.dart';

class SetChecklistDialog extends ConsumerStatefulWidget {
  const SetChecklistDialog({
    super.key,
    required this.checklistTemp,
  });

  final ChecklistTemp checklistTemp;

  @override
  ConsumerState<SetChecklistDialog> createState() => _SetChecklistDialogState();
}

class _SetChecklistDialogState extends ConsumerState<SetChecklistDialog> {
  late String tempTitle;
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(
      text: widget.checklistTemp.title,
    );
    tempTitle = widget.checklistTemp.title;
  }

  Widget _buildTitle() {
    return TextField(
      controller: _controller,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white60),
        ),
        labelText: 'Checklist Title',
        labelStyle: FontSettings.primaryFont.copyWith(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        ref.watch(checklistItemsEditProvider.notifier).setChecklistTitle(value);
      },
    );
  }

  Widget _buildAddItems() {
    return InkWell(
      onTap: () {
        ref.watch(checklistItemsEditProvider.notifier).addChecklistItem(ChecklistItemTemp(
              detail: "",
              checked: false,
            ));
      },
      child: Container(
        height: 60,
        color: Colors.white10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_rounded, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              "Add Checklist Item",
              style: FontSettings.primaryFont,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white54),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close_rounded, color: Colors.white),
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white54),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  final checklistTemp = ref.watch(checklistItemsEditProvider);
                  Navigator.pop(context, checklistTemp);
                },
                child: Icon(Icons.check_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tempChecklistItems = ref.watch(checklistItemsEditProvider);

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white54),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tempChecklistItems != null ? tempChecklistItems.items.length : 0,
                itemBuilder: (context, index) {
                  return EditableChecklistItem(
                    itemIndex: index,
                    checklistItemTemp: tempChecklistItems.items[index],
                  );
                },
              ),
              _buildAddItems(),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditableChecklistItem extends ConsumerStatefulWidget {
  EditableChecklistItem({
    super.key,
    required this.itemIndex,
    required this.checklistItemTemp,
  });

  final int itemIndex;
  final ChecklistItemTemp checklistItemTemp;

  @override
  ConsumerState<EditableChecklistItem> createState() => _EditableChecklistItemState();
}

class _EditableChecklistItemState extends ConsumerState<EditableChecklistItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController(text: widget.checklistItemTemp.detail);
  }

  Widget _buildDetail(WidgetRef ref) {
    return TextField(
      controller: _controller,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white24),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white60),
        ),
        labelText: 'Item ${widget.itemIndex + 1} Detail',
        labelStyle: FontSettings.primaryFont.copyWith(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        ref.watch(checklistItemsEditProvider.notifier).updateChecklistItemDetailByIndex(widget.itemIndex, value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: _buildDetail(ref),
          ),
          Container(
            width: 40,
            height: 40,
            child: InkWell(
              onTap: () {
                ref.watch(checklistItemsEditProvider.notifier).removeChecklistItemAtIndex(widget.itemIndex);
              },
              child: Container(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<ChecklistTemp?> setChecklist({
  required BuildContext context,
  required ChecklistTemp checklistTemp,
}) {
  return showDialog<ChecklistTemp?>(
    context: context,
    builder: (context) {
      return SetChecklistDialog(
        checklistTemp: checklistTemp,
      );
    },
  );
}
