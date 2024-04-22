import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/image/image_list_model.dart';
import 'package:shopify_example/src/common/model/price_range/price_range_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';
import 'package:shopify_example/src/feature/product_details/model/product_variant_list_model.dart';

part 'product_recommendations_model.g.dart';

@JsonSerializable()
class ProductRecommendationsModel extends ProductModel {
  const ProductRecommendationsModel({
    required super.handle,
    required super.id,
    required super.images,
    required super.priceRange,
    required super.title,
    required this.variants,
  });

  final ProductVariantListModel variants;

  @override
  List<Object?> get props => [super.props, variants];

  factory ProductRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRecommendationsModelFromJson(json);
}
