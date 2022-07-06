import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/application.dart';
import 'package:pajacyk/presentation/application/theme.dart';

import '../domain/notification_assistant/notification_assistant.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi.init();

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
