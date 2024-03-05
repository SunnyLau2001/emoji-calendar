import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/providers/init_database_notifier.dart';
import 'package:fyp_our_sky_new/utils/font_settings.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("hello"),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      ref.read(initDatabaseProvider.notifier).initMultidayEventDatabase();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        "Init DataBase",
                        style: FontSettings.primaryFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
