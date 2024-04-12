import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant_price_model.g.dart';

@JsonSerializable()
class VariantPriceModel extends Equatable {
  final String amount;
  final String currencyCode;

  const VariantPriceModel({
    required this.amount,
    required this.currencyCode,
  });

  @override
  List<Object?> get props => [amount, currencyCode];

  factory VariantPriceModel.fromJson(Map<String, dynamic> json) =>
      _$VariantPriceModelFromJson(json);
}
