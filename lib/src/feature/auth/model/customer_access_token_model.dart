import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'customer_access_token_model.g.dart';

@JsonSerializable()
class CustomerAccessTokenModel extends Equatable {
  final String accessToken;
  final DateTime expiresAt;

  const CustomerAccessTokenModel({
    required this.accessToken,
    required this.expiresAt,
  });

  @override
  List<Object> get props => [accessToken, expiresAt];

  factory CustomerAccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAccessTokenModelToJson(this);
}
