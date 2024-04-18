import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends Equatable {
  const CartModel({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
