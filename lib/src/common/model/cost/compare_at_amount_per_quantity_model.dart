import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'compare_at_amount_per_quantity_model.g.dart';

@JsonSerializable()
class CompareAtAmountPerQuantityModel extends Equatable {
  final String amount;
  final String currencyCode;

  const CompareAtAmountPerQuantityModel({
    required this.amount,
    required this.currencyCode,
  });

  @override
  List<Object?> get props => [amount, currencyCode];

  factory CompareAtAmountPerQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$CompareAtAmountPerQuantityModelFromJson(json);
}
