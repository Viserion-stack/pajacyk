import 'package:pajacyk/domain/model/pajacyk_model.dart';
import 'package:pajacyk/remote/mapper/mapper.dart';
import 'package:pajacyk/remote/model/pajacyk_remote_model.dart';

class PajacykRemoteToPajacykMapper implements Mapper<PajacykRemoteModel, PajacykModel> {
  const PajacykRemoteToPajacykMapper();

  @override
  PajacykModel map(PajacykRemoteModel element) {
    return PajacykModel(
      count: element.count,
      done: element.done,
    );
  }
}
