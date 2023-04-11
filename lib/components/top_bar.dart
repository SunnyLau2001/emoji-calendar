import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/multiday_event_detail_dialog.dart';
import 'package:fyp_our_sky_new/providers/date_range_selected_notifier.dart';
import 'package:fyp_our_sky_new/providers/multiday_event_detail_notifier.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';
import 'package:fyp_our_sky_new/utils/app_settings.dart';
import 'package:go_router/go_router.dart';

import 'calendar_header.dart';

class TopBar extends ConsumerWidget {
  const TopBar({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelecting = ref.watch(isSelectingDateRangeProvider);
    final showSideMenu = ref.watch(showSideMenuProvider);
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Side menu button
            Consumer(builder: (context, ref, child) {
              final showSideMenu = ref.watch(showSideMenuProvider);
              return AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: showSideMenu ? 14 + (MediaQuery.of(context).size.width - 100) : 14,
                top: 14,
                child: IgnorePointer(
                  ignoring: isSelecting,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: isSelecting ? 0 : 1,
                    curve: Curves.easeInOut,
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: 40,
                        height: 40,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () async {
                              ref.read(showSideMenuProvider.notifier).state = !showSideMenu;
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ),
              );
            }),
            // Cancel multiday event date range selection
            Positioned(
              left: 14,
              top: 14,
              child: IgnorePointer(
                ignoring: !isSelecting,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  opacity: isSelecting ? 1 : 0,
                  child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white54),
                      ),
                      width: 40,
                      height: 40,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            if (isSelecting) ref.read(isSelectingDateRangeProvider.notifier).state = false;
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            // Enter multiday event date range selection
            Positioned(
              right: 14,
              top: 14,
              child: IgnorePointer(
                ignoring: isSelecting || showSideMenu ? true : false,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  opacity: isSelecting || showSideMenu ? 0 : 1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    width: 40,
                    height: 40,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          ref.read(multidayEventDetailProvider.notifier).initDateRange();
                          ref.read(isSelectingDateRangeProvider.notifier).state = true;
                        },
                        child: Icon(
                          Icons.edit_calendar_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Confirm date range and route to multidayEventEdit page
            Positioned(
              right: 14,
              top: 14,
              child: IgnorePointer(
                ignoring: isSelecting ? false : true,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  opacity: isSelecting ? 1 : 0,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white54),
                    ),
                    width: 40,
                    height: 40,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () async {
                          createMultidayEventEventDetail(context: context);
                          // context.go('/multidayEventEdit');

                          // ref.read(isSelectingDateRangeProvider.notifier).state = false;
                        },
                        child: Icon(
                          Icons.check_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 10,
              child: SizedBox(
                // height: height - 20,
                child: CalendarHeader(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
