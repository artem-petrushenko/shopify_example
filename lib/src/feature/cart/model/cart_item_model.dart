import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/cost/cost_model.dart';
import 'package:shopify_example/src/feature/cart/model/discount_allocations_model.dart';
import 'package:shopify_example/src/feature/cart/model/merchandise_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel extends Equatable {
  final String id;
  final int quantity;
  final CostModel cost;
  final MerchandiseModel merchandise;
  final List<DiscountAllocationsModel> discountAllocations;

  const CartItemModel({
    required this.id,
    required this.quantity,
    required this.cost,
    required this.merchandise,
    required this.discountAllocations,
  });

  @override
  List<Object?> get props => [id, quantity, cost, merchandise];

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
