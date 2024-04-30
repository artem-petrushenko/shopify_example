import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/variant_price/price_model.dart';

part 'cart_cost_model.g.dart';

@JsonSerializable()
class CartCostModel extends Equatable {
  final PriceModel subtotalAmount;
  final PriceModel totalAmount;
  final PriceModel checkoutChargeAmount;

  const CartCostModel({
    required this.subtotalAmount,
    required this.totalAmount,
    required this.checkoutChargeAmount,
  });

  factory CartCostModel.fromJson(Map<String, dynamic> json) =>
      _$CartCostModelFromJson(json);

  @override
  List<Object?> get props =>
      [subtotalAmount, totalAmount, checkoutChargeAmount];
}
