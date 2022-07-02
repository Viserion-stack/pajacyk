import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_argument.dart';

part 'pajacyk_event.dart';
part 'pajacyk_state.dart';

class PajacykBloc extends Bloc<PajacykEvent, PajacykState> {
  PajacykBloc({required this.argument}) : super(PajacykState.initial(argument: argument)) {
    on<PajacykEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final PajacykArgument argument;
}
