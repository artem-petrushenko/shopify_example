import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/cart/model/cart_items_list_model.dart';

part 'cart_items_response_model.g.dart';

@JsonSerializable()
class CartItemsResponseModel extends Equatable {
  @JsonKey(name: 'lines')
  final CartItemsListModel items;
  final int totalQuantity;
  final String id;

  const CartItemsResponseModel({
    required this.items,
    required this.totalQuantity,
    required this.id,
  });

  factory CartItemsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemsResponseModelFromJson(json);

  @override
  List<Object?> get props => [items, totalQuantity, id];
}
