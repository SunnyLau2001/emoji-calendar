import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/components/screen_frame.dart';

void main() {
  runApp(ProviderScope(child: const OurSkyApp()));
}

class OurSkyApp extends StatelessWidget {
  const OurSkyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Sky v2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenFrame(),
    );
  }
}
