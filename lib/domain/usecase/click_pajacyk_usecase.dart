import 'package:fpdart/fpdart.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/domain/usecase/usecase.dart';

enum ClickPajacykFailure { fatal }

class ClickPajacykUsecase implements UseCase<ClickPajacykFailure, PajacykModel> {
  const ClickPajacykUsecase({
    required ClickPajacykRemoteSourceAction clickPajacykRemoteSourceAction,
  }) : _clickPajacykRemoteSourceAction = clickPajacykRemoteSourceAction;

  final ClickPajacykRemoteSourceAction _clickPajacykRemoteSourceAction;

  @override
  TaskEither<ClickPajacykFailure, PajacykModel> execute() {
    return _clickPajacykRemoteSourceAction.execute().bimap(
          (l) => ClickPajacykFailure.fatal,
          (r) => r,
        );
  }
}
