import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/cart/model/cart_item_model.dart';

part 'cart_items_list_model.g.dart';

@JsonSerializable()
class CartItemsListModel extends Equatable {
  @JsonKey(name: 'nodes')
  final List<CartItemModel> cartItems;

  const CartItemsListModel({
    required this.cartItems,
  });

  factory CartItemsListModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemsListModelFromJson(json);

  @override
  List<Object?> get props => [cartItems];
}
