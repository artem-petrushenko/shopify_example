import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/cart/model/cost/cart_cost_model.dart';

part 'cart_cost_response_model.g.dart';

@JsonSerializable()
class CartCostResponseModel extends Equatable {
  final String checkoutUrl;
  final CartCostModel cost;

  const CartCostResponseModel({
    required this.checkoutUrl,
    required this.cost,
  });

  factory CartCostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartCostResponseModelFromJson(json);

  @override
  List<Object?> get props => [checkoutUrl, cost];
}
