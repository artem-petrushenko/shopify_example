import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/products/model/image_list_model.dart';
import 'package:shopify_example/src/feature/products/model/price_range_model.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel extends Equatable {
  final String createdAt;
  final String description;
  final String id;
  final bool isGiftCard;
  final String publishedAt;
  final bool requiresSellingPlan;
  final List<String> tags;
  final String title;
  final String updatedAt;
  final String? handle;
  final String? onlineStoreUrl;
  final String? productDetailsModelType;
  final PriceRangeModel priceRange;
  final ImageListModel images;
  // final CollectionModel collections;

  const ProductDetailsModel({
    required this.createdAt,
    required this.description,
    required this.id,
    required this.isGiftCard,
    required this.publishedAt,
    required this.requiresSellingPlan,
    required this.tags,
    required this.title,
    required this.updatedAt,
    this.handle,
    this.onlineStoreUrl,
    this.productDetailsModelType,
    required this.priceRange,
    required this.images,
    // required this.collections,
  });

  @override
  List<Object?> get props => [
        createdAt,
        description,
        id,
        isGiftCard,
        publishedAt,
        requiresSellingPlan,
        tags,
        title,
        updatedAt,
        handle,
        onlineStoreUrl,
        productDetailsModelType,
        priceRange,
        images,
        // collections,
      ];

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}
