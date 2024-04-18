import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_per_quantity_model.g.dart';

@JsonSerializable()
class AmountPerQuantityModel extends Equatable {
  final String amount;
  final String currencyCode;

  const AmountPerQuantityModel({
    required this.amount,
    required this.currencyCode,
  });

  factory AmountPerQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$AmountPerQuantityModelFromJson(json);

  @override
  List<Object?> get props => [amount, currencyCode];
}
