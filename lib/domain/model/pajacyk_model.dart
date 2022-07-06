class PajacykModel {
  const PajacykModel({
    required this.count,
    required this.done,
  });
  final String count;
  final bool done;

  factory PajacykModel.fromJson(Map<String, dynamic> json) {
    return PajacykModel(
      count: json['count'] ?? '',
      done: json['done'] ?? '',
    );
  }
}
