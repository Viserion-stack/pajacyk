import 'package:fpdart/src/task_either.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/domain/model/error_detail.dart';

class ClickPajacykRemoteSourceActionImpl implements ClickPajacykRemoteSourceAction {
  const ClickPajacykRemoteSourceActionImpl();

  @override
  TaskEither<ErrorDetail, PajacykModel> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
