import 'package:fpdart/fpdart.dart';
import 'package:pajacyk/domain/usecase/usecase.dart';

enum ClickPajacykFailure { fatal }

class ClickPajacykUsecase implements UseCase<ClickPajacykFailure, Unit> {
  const ClickPajacykUsecase();

  @override
  TaskEither<ClickPajacykFailure, Unit> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
