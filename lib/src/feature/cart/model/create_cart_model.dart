import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/cart/model/cart_model.dart';

part 'create_cart_model.g.dart';

@JsonSerializable()
class CreateCartModel extends Equatable {
  const CreateCartModel({
    required this.cart,
  });

  final CartModel cart;

  @override
  List<Object?> get props => [cart];

  factory CreateCartModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCartModelFromJson(json);
}
