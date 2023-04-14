import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/models/checklist.dart';
import 'package:fyp_our_sky_new/providers/checklist_temp_prop.dart';
import 'package:fyp_our_sky_new/providers/date_detail_provider.dart';
import 'package:fyp_our_sky_new/providers/put_checklist_notifier.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

class ViewChecklistDialog extends ConsumerWidget {
  const ViewChecklistDialog({
    super.key,
    required this.checklistId,
  });

  final int checklistId;

  Widget _buildChecklistTitle() {
    return Container();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(width: 1, color: Colors.white54),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ViewChecklistDialogContent(
            checklistId: checklistId,
          ),
        ),
      ),
    );
  }
}

class ViewChecklistDialogContent extends ConsumerStatefulWidget {
  const ViewChecklistDialogContent({
    super.key,
    required this.checklistId,
  });

  final int checklistId;

  @override
  ConsumerState<ViewChecklistDialogContent> createState() => _ViewChecklistDialogContentState();
}

class _ViewChecklistDialogContentState extends ConsumerState<ViewChecklistDialogContent> {
  String title = "";
  Checklist? tempChecklist;
  bool editMode = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    return Colors.transparent;
  }

  Widget _buildTitle(Checklist? checklist) {
    if (checklist == null) return SizedBox();
    final String title = checklist.title == "" ? "(No Title)" : checklist.title;
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      height: 56,
      child: Text(title, style: FontSettings.primaryFont.copyWith(fontSize: 24)),
    );
  }

  Widget _buildCheckableChecklist(Checklist? checklist, List<ChecklistItem> items) {
    if (checklist == null) return SizedBox();

    if (tempChecklist!.checklist.length == 0) {
      return Container(
        alignment: Alignment.center,
        height: 400 - 56,
        child: Text(
          "No checklist item added",
          style: FontSettings.primaryFont,
        ),
      );
    }

    return Container(
      height: 400 - 56,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              final newCheck = !tempChecklist!.checklist[index].checked;
              tempChecklist!.checklist[index].checked = newCheck;
              await ref.read(putChecklistProvider.notifier).putChecklistToDB(tempChecklist);
              // onChanged(!value);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      checklist.checklist[index].detail == "" ? "(No Detail)" : checklist.checklist[index].detail,
                      style: FontSettings.primaryFont,
                    ),
                  ),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                      return BorderSide(color: Colors.white54);
                    }),
                    value: items[index].checked,
                    onChanged: (bool? newValue) {
                      // onChanged(newValue!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditModeButton(bool edit) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            if (edit) {
              setState(() {
                editMode = false;
              });
              final newChecklist = tempChecklist;
              ref.read(putChecklistProvider.notifier).putChecklistToDB(newChecklist);
            }
            if (!edit) {
              setState(() {
                editMode = true;
              });
            }
          },
          child: Icon(
            edit ? Icons.check_rounded : Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNormalView(double width, List<ChecklistItem> items) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: 400,
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(tempChecklist),
                _buildCheckableChecklist(tempChecklist, items),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableTitle(double width) {
    if (tempChecklist == null) return SizedBox();
    return Container(
      height: 76,
      width: width,
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: TextEditingController(text: tempChecklist!.title),
        style: FontSettings.primaryFont,
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
          tempChecklist!.title = value;
          // ref.watch(checklistItemsEditProvider.notifier).setChecklistTitle(value);
        },
      ),
    );
  }

  Widget _buildAddItems(double width) {
    return InkWell(
      onTap: () {
        if (tempChecklist == null) return;
        final newChecklistItem = ChecklistItem()
          ..detail = ""
          ..checked = false;
        final newItems = [...tempChecklist!.checklist, newChecklistItem];
        setState(() {
          tempChecklist!.checklist = newItems;
        });
      },
      child: Container(
        height: 60,
        width: width,
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

  Widget _buildEditableChecklist(double width) {
    if (tempChecklist == null) return SizedBox();
    return Container(
      padding: EdgeInsets.all(8),
      height: 400 - 76 - 60,
      width: width,
      child: ListView.builder(
        itemCount: tempChecklist!.checklist.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            width: width - 16,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: SizedBox(
                    width: width - 16,
                    child: TextField(
                      controller: TextEditingController(
                        text: tempChecklist!.checklist[index].detail,
                      ),
                      style: FontSettings.primaryFont,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.white24),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.white60),
                        ),
                        labelText: 'Item ${index + 1} Detail',
                        labelStyle: FontSettings.primaryFont.copyWith(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      onChanged: (value) {
                        tempChecklist!.checklist[index].detail = value;
                        // ref.watch(checklistItemsEditProvider.notifier).setChecklistTitle(value);
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          if (tempChecklist == null) return;
                          List<ChecklistItem> tempItems = [...tempChecklist!.checklist];
                          if (index > tempItems.length - 1) return;
                          tempItems.removeAt(index);

                          final newChecklist = [...tempItems];
                          setState(() {
                            tempChecklist!.checklist = newChecklist;
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditView(double width) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: 400,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: _buildEditableTitle(width),
                ),
                Positioned(
                  top: 76,
                  child: _buildEditableChecklist(width),
                ),
                Positioned(
                  bottom: 0,
                  child: _buildAddItems(width),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    final checklistWatch = ref.watch(ChecklistWatcherProvider(checklistId: widget.checklistId));

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          height: 400,
          width: width,
          child: checklistWatch.when(
            data: (data) {
              if (data == null) return SizedBox();
              tempChecklist = data;

              return Stack(
                children: [
                  editMode ? _buildEditView(width) : _buildNormalView(width, data.checklist),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: _buildEditModeButton(editMode),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              return Text("Error");
            },
            loading: () {
              return CircularProgressIndicator(
                color: Colors.white,
              );
            },
          ),
        );
      },
    );
  }
}

Future<void> viewChecklistOfEvent({
  required BuildContext context,
  required int checklistId,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return ViewChecklistDialog(
        checklistId: checklistId,
      );
    },
  );
}
