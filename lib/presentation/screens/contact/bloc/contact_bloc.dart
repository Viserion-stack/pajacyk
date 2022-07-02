import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pajacyk/presentation/screens/contact/contact_argument.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc({required this.argument}) : super(ContactState.initial(argument: argument)) {
    on<ContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final ContactArgument argument;
}
