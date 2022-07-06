class PajacykModel {
  const PajacykModel({
    required this.count,
    required this.done,
  });
  final String count;
  final bool done;

  List<Object> get props => [count, done];
}
