import 'package:flutter/material.dart';
import 'package:fyp_our_sky_new/components/month_view.dart';
import 'package:fyp_our_sky_new/components/top_bar.dart';

import 'overlay.dart';

class ScreenFrame extends StatefulWidget {
  const ScreenFrame({super.key});

  @override
  State<ScreenFrame> createState() => _ScreenFrameState();
}

class _ScreenFrameState extends State<ScreenFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/background/background-sky.jpg",
              fit: BoxFit.fitHeight,
              alignment: Alignment(0.4, 1),
            ),
          ),
          CustomOverlay(),
          TopBar(height: 120),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width,
              child: MonthView(),
            ),
          ),
        ],
      ),
    );
  }
}
