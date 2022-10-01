import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app_themes.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'core/services/navigation/navigation_service.dart';

Logger logger = Logger(
  printer: PrettyPrinter(),
);

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Free Online Radio Philippines',
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
      theme: AppThemes.light,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      debugShowCheckedModeBanner: true,
      darkTheme: AppThemes.light,
    );
  }
}
