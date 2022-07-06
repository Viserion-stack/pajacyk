import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../wesprzyj_argument.dart';

part 'wesprzyj_bloc_event.dart';
part 'wesprzyj_bloc_state.dart';

class WesprzyjBloc extends Bloc<WesprzyjBlocEvent, WesprzyjState> {
  final WesprzyjArgument argument;
  WesprzyjBloc({
    required this.argument,
  }) : super(WesprzyjState.initial(argument: argument)) {
    on<WesprzyjBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
