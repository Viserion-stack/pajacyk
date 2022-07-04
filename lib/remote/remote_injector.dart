import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/remote/data_source_action/press_pajacyk_remote_source_action_impl.dart';
import 'package:pajacyk/remote/dio_provider.dart';

extension RemoteInjector on GetIt {
  void registerRemote() {
    this
      .._registerApi()
      .._registerRemoteSourceAction()
      ..registerFactory<Dio>(
        () => DioProvider.create(baseUrl: 'https://www.pajacyk.pl/'),
        instanceName: DioProvider.dioNoAuth,
      );
  }

  void _registerRemoteSourceAction() {
    registerFactory<ClickPajacykRemoteSourceAction>(() => const ClickPajacykRemoteSourceActionImpl());
  }

  void _registerApi() {}
}
