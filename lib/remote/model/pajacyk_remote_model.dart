import 'package:json_annotation/json_annotation.dart';

part 'pajacyk_remote_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PajacykRemoteModel {
  const PajacykRemoteModel({
    required this.count,
    required this.done,
  });

  factory PajacykRemoteModel.fromJson(Map<String, dynamic> json) => _$PajacykRemoteModelFromJson(json);

  final String count;
  final bool done;

  Map<String, dynamic> toJson() => _$PajacykRemoteModelToJson(this);
}
