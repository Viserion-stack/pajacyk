import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/wesprzyj/bloc/wesprzyj_bloc.dart';

import 'wesprzyj_argument.dart';
import 'wesprzyj_screen.dart';

Route<dynamic> wesprzyjRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<WesprzyjBloc>(
          create: (context) => injector<WesprzyjBloc>(
            param1: settings.arguments ?? const WesprzyjArgument(),
          ),
        ),
      ],
      child: const WesprzyjScreen(),
    ),
  );
}
