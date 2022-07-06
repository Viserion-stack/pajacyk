import 'package:get_it/get_it.dart';
import 'package:pajacyk/domain/domain_injector.dart';
import 'package:pajacyk/presentation/components/auth/bloc/auth_bloc.dart';
import 'package:pajacyk/presentation/screens/contact/bloc/contact_bloc.dart';
import 'package:pajacyk/presentation/screens/contact/contact_argument.dart';
import 'package:pajacyk/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_argument.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pajacyk/presentation/screens/home/home_argument.dart';
import 'package:pajacyk/presentation/screens/pajacyk/bloc/pajacyk_bloc.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_argument.dart';
import 'package:pajacyk/presentation/screens/wesprzyj/bloc/wesprzyj_bloc.dart';
import 'package:pajacyk/remote/remote_injector.dart';

import 'screens/wesprzyj/wesprzyj_argument.dart';

final injector = GetIt.instance;

Future<void> init() async {
  await injector.registerDomain();

  injector
    ..registerRemote()
    ..registerLazySingleton<AuthBloc>(() => AuthBloc())
    ..registerFactoryParam<DashboardBloc, DashboardArgument, void>(
      (argument, _) => DashboardBloc(argument: argument),
    )
    ..registerFactoryParam<HomeBloc, HomeArgument, void>(
      (argument, _) => HomeBloc(
        argument: argument,
        notificationApi: injector.get(),
      ),
    )
    ..registerFactoryParam<ContactBloc, ContactArgument, void>(
        (argument, _) => ContactBloc(argument: argument))
    ..registerFactoryParam<WesprzyjBloc, WesprzyjArgument, void>(
        (argument, _) => WesprzyjBloc(argument: argument))
    ..registerFactoryParam<PajacykBloc, PajacykArgument, void>(
        (argument, _) => PajacykBloc(argument: argument));
}
