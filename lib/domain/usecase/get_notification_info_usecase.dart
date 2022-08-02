import 'package:fpdart/src/task_either.dart';
import 'package:pajacyk/domain/store/pajacyk_store.dart';
import 'package:pajacyk/domain/usecase/usecase.dart';

enum GetNotificationInfoFailure { fatal }

class GetNotificationInfoUsecase implements UseCase<GetNotificationInfoFailure, bool> {
  const GetNotificationInfoUsecase({required PajacykStore pajacykStore}) : _pajacykStore = pajacykStore;

  final PajacykStore _pajacykStore;

  @override
  TaskEither<GetNotificationInfoFailure, bool> execute() {
    return _pajacykStore.getNotificationInfo().bimap(
          (l) => GetNotificationInfoFailure.fatal,
          (r) => r!,
        );
  }
}
