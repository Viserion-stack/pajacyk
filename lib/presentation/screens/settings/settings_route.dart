import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:pajacyk/presentation/screens/settings/settings_screen.dart';

Route<dynamic> settingsRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => BlocProvider<SettingsBloc>(
      create: (context) => injector<SettingsBloc>()
        ..add(
          OnInitiatedEvent(),
        ),
      child: const SettingsScreen(),
    ),
  );
}
