import 'package:fpdart/fpdart.dart';
import 'package:pajacyk/domain/model/error_detail.dart';
import 'package:pajacyk/domain/model/pajacyk_model.dart';

abstract class ClickPajacykRemoteSourceAction {
  TaskEither<ErrorDetail, PajacykModel> execute();
}
