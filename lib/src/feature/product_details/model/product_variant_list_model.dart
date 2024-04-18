import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_model.dart';

part 'product_variant_list_model.g.dart';

@JsonSerializable()
class ProductVariantListModel extends Equatable {
  @JsonKey(name: 'nodes')
  final List<ProductVariantModel> variants;

  const ProductVariantListModel({
    required this.variants,
  });

  factory ProductVariantListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantListModelFromJson(json);

  @override
  List<Object?> get props => [variants];
}
