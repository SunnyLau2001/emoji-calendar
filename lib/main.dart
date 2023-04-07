import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_our_sky_new/pages/main_page.dart';
import 'package:fyp_our_sky_new/pages/multiday_event_edit_page.dart';
import 'package:fyp_our_sky_new/services/isar_service.dart';
import 'package:fyp_our_sky_new/services/sticker_service.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all db that will be used
  await IsarService.initIsar();
  await StickerService.initSticker();

  runApp(ProviderScope(child: const OurTimeApp()));
}

class OurTimeApp extends StatelessWidget {
  const OurTimeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppRouter();
  }
}

class AppRouter extends StatelessWidget {
  AppRouter({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(),
        routes: [
          GoRoute(
            path: 'multidayEventEdit',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: MultidayEventEdit(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Our Time v2',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
