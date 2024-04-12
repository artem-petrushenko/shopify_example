import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/products/model/product_details_model.dart';

part 'product_details_response_model.g.dart';

@JsonSerializable()
class ProductDetailsResponseModel extends Equatable {
  final ProductDetailsModel product;

  const ProductDetailsResponseModel({
    required this.product,
  });

  @override
  List<Object> get props => [product];

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseModelFromJson(json);
}
