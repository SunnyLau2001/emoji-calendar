import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/providers.dart';

class CustomOverlay extends ConsumerWidget {
  const CustomOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelecting = ref.watch(isSelectingProvider);
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: isSelecting ? 0.6 : 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.black,
      ),
    );
  }
}
