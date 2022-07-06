import 'package:dio/dio.dart' hide Headers;
import 'package:pajacyk/remote/model/pajacyk_remote_model.dart';
import 'package:retrofit/retrofit.dart';

part 'pajacyk_api.g.dart';

@RestApi()
abstract class PajacykApi {
  factory PajacykApi(Dio dio) = _PajacykApi;

  @POST('/api/clicks')
  Future<PajacykRemoteModel> clickPajacyk();
}
