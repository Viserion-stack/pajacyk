part of 'contact_bloc.dart';

class ContactState extends Equatable {
  const ContactState({required this.isProcessing});

  final bool isProcessing;

  factory ContactState.initial({required ContactArgument argument}) {
    return const ContactState(isProcessing: false);
  }

  @override
  List<Object> get props => [isProcessing];

  ContactState copyWith({
    bool? isProcessing,
  }) {
    return ContactState(
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }

  @override
  String toString() => 'ContactState(isProcessing: $isProcessing)';
}
