import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/main_injector.dart' as di;
import 'package:pajacyk/presentation/application/application.dart';
import 'package:pajacyk/presentation/application/theme.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

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
