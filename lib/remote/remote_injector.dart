import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/remote/api/pajacyk_api.dart';
import 'package:pajacyk/remote/data_source_action/press_pajacyk_remote_source_action_impl.dart';
import 'package:pajacyk/remote/dio_provider.dart';
import 'package:pajacyk/remote/mapper/mapper.dart';
import 'package:pajacyk/remote/mapper/pajacyk_remote_to_pajacyk.dart';
import 'package:pajacyk/remote/model/pajacyk_remote_model.dart';
import 'package:pajacyk/remote/other/error/error_converter.dart';

extension RemoteInjector on GetIt {
  void registerRemote() {
    this
      .._registerMappers()
      .._registerApi()
      .._registerRemoteSourceAction()
      ..registerSingleton(const ErrorConverter())
      ..registerFactory<Dio>(
        () => DioProvider.create(baseUrl: 'https://www.pajacyk.pl/'),
        instanceName: DioProvider.dioNoAuth,
      );
  }

  void _registerRemoteSourceAction() {
    registerFactory<ClickPajacykRemoteSourceAction>(() => ClickPajacykRemoteSourceActionImpl(
          pajacykRemoteModelToPajacykMapper: get(),
          errorConverter: get(),
          pajacykApi: get(),
        ));
  }

  void _registerApi() {
    registerFactory<PajacykApi>(
      () => PajacykApi(get(instanceName: DioProvider.dioNoAuth)),
    );
  }

  void _registerMappers() {
    registerFactory<Mapper<PajacykRemoteModel, PajacykModel>>(() => const PajacykRemoteToPajacykMapper());
  }
}
