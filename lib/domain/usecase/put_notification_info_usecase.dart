import 'package:fpdart/src/task_either.dart';
import 'package:pajacyk/domain/store/pajacyk_store.dart';
import 'package:pajacyk/domain/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

enum PutNotificationInfoFailure { fatal }

class PutNotificationInfoParam {
  const PutNotificationInfoParam({
    required this.isNotification,
  });

  final bool isNotification;
}

class PutNotificationInfoUsecase implements ParamUseCase<PutNotificationInfoFailure, bool, PutNotificationInfoParam> {
  const PutNotificationInfoUsecase({
    required PajacykStore pajacykStore,
  }) : _pajacykStore = pajacykStore;

  final PajacykStore _pajacykStore;

  @override
  TaskEither<PutNotificationInfoFailure, bool> execute({
    required PutNotificationInfoParam param,
  }) {
    return _pajacykStore.putNotificationInfo(value: param.isNotification).bimap(
          (l) => PutNotificationInfoFailure.fatal,
          (r) => r,
        );
  }
}
