import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/collection/model/product_list_model.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel extends Equatable {
  final ProductListModel products;

  const ProductsResponseModel({
    required this.products,
  });

  @override
  List<Object?> get props => [products];

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
