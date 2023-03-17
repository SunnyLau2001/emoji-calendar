import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSideMenu extends ConsumerWidget {
  const CustomSideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white24),
            borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Text("hello"),
            ]),
          ),
        ),
      ),
    );
  }
}
