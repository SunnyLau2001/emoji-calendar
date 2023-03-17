import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';

import 'calendar_header.dart';

class TopBar extends ConsumerWidget {
  const TopBar({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelecting = ref.watch(isSelectingProvider);
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 14,
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
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
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
                      ),
                      width: 40,
                      height: 40,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            if (isSelecting) ref.read(isSelectingProvider.notifier).state = false;
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            Positioned(
              right: 14,
              top: 14,
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
                      ref.read(isSelectingProvider.notifier).state = true;
                      print(ref.read(isSelectingProvider));
                    },
                    child: Icon(
                      Icons.edit_calendar_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
              child: CalendarHeader(),
            ),
          ],
        ),
      ),
    );
  }
}
