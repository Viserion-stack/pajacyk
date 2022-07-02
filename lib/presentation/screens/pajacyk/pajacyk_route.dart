import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/pajacyk/bloc/pajacyk_bloc.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_argument.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_screen.dart';

Route<dynamic> pajacykRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<PajacykBloc>(
          create: (context) => injector<PajacykBloc>(
            param1: settings.arguments ?? const PajacykArgument(),
          ),
        ),
      ],
      child: const PajacykScreen(),
    ),
  );
}
