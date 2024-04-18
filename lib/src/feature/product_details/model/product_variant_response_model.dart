import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_list_model.dart';

part 'product_variant_response_model.g.dart';

@JsonSerializable()
class ProductVariantResponseModel extends Equatable {
  final ProductVariantListModel variants;

  const ProductVariantResponseModel({
    required this.variants,
  });

  factory ProductVariantResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantResponseModelFromJson(json);

  @override
  List<Object?> get props => [variants];
}
