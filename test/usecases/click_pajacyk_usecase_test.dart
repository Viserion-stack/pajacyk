import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pajacyk/domain/data_source_action/press_pajacyk_remote_source_action.dart';
import 'package:pajacyk/domain/model/error_detail.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/domain/usecase/click_pajacyk_usecase.dart';

class MockClickPajacykRemoteSourceAction extends Mock implements ClickPajacykRemoteSourceAction {}

void main() {
  late MockClickPajacykRemoteSourceAction mockClickPajacykRemoteSourceAction;
  late ClickPajacykUsecase clickPajacykUsecase;

  setUp(
    () {
      mockClickPajacykRemoteSourceAction = MockClickPajacykRemoteSourceAction();
      clickPajacykUsecase = ClickPajacykUsecase(clickPajacykRemoteSourceAction: mockClickPajacykRemoteSourceAction);
    },
  );

  const pajacykResponse = PajacykModel(
    count: '1212',
    done: true,
  );

  group(
    'Click Pajacyk Usecase',
    () {
      test(
        'Should call ClickPajacykRemoteSouurceAction and return pajacyk response when no error has occured',
        () async {
          when(
            () => mockClickPajacykRemoteSourceAction.execute(),
          ).thenReturn(TaskEither<ErrorDetail, PajacykModel>.right(pajacykResponse));

          final result = await clickPajacykUsecase.execute().run();

          result.match(
            (it) => throw it,
            (it) => expect(it, pajacykResponse),
          );
        },
      );

      test(
        'Should call ClickPajacykRemoteSouurceAction and return failure when  error has occured',
        () async {
          when(
            () => mockClickPajacykRemoteSourceAction.execute(),
          ).thenReturn(TaskEither<ErrorDetail, PajacykModel>.left(ErrorDetail.errorCode()));

          final result = await clickPajacykUsecase.execute().run();

          result.match(
            (it) => expect(it, ClickPajacykFailure.fatal),
            (it) => throw it,
          );
        },
      );
    },
  );
}
