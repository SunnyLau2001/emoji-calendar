import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class CustomFloatButton extends ConsumerWidget {
  const CustomFloatButton({
    super.key,
    required this.monthViewController,
  });
  final ScrollController monthViewController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showBackToCurrent = ref.watch(showBackToCurrentProvider);
    return IgnorePointer(
      ignoring: !showBackToCurrent,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        opacity: showBackToCurrent ? 1 : 0,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                monthViewController.animateTo(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  ref.watch(initOffsetProvider),
                );
              },
              child: Icon(
                Icons.rotate_90_degrees_cw_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
