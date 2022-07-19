import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pajacyk/presentation/application/application.dart';
import 'package:pajacyk/presentation/application/theme.dart';

import '../domain/notification_assistant/notification_assistant.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi.init();

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black87,
      //systemNavigationBarIconBrightness: Brightness.light
    ));
    //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //       overlays: [SystemUiOverlay.top]);
  }

  runZonedGuarded(
    () {
      runApp(
        Application(
          appTheme: AppTheme(),
        ),
      );
    },
    (error, stackTrace) {
      debugPrint('runZonedGuarded');
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    },
  );
}
