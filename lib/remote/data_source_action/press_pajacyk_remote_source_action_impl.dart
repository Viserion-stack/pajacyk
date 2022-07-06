import 'package:fpdart/src/task_either.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/domain/model/error_detail.dart';
import 'package:pajacyk/remote/api/pajacyk_api.dart';
import 'package:pajacyk/remote/mapper/mapper.dart';
import 'package:pajacyk/remote/mapper/pajacyk_remote_to_pajacyk.dart';
import 'package:pajacyk/remote/model/pajacyk_remote_model.dart';
import 'package:pajacyk/remote/other/error/error_converter.dart';

class ClickPajacykRemoteSourceActionImpl implements ClickPajacykRemoteSourceAction {
  const ClickPajacykRemoteSourceActionImpl({
    required Mapper<PajacykRemoteModel, PajacykModel> pajacykRemoteModelToPajacykMapper,
    required ErrorConverter errorConverter,
    required PajacykApi pajacykApi,
  });

  @override
  TaskEither<ErrorDetail, PajacykModel> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
