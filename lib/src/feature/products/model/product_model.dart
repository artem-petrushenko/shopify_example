import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/products/model/image_list_model.dart';
import 'package:shopify_example/src/feature/products/model/price_range_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final bool availableForSale;
  final String createdAt;
  final String handle;
  final String id;
  final String title;
  final PriceRangeModel priceRange;
  final ImageListModel images;

  const ProductModel({
    required this.availableForSale,
    required this.createdAt,
    required this.handle,
    required this.id,
    required this.title,
    required this.priceRange,
    required this.images,
  });

  @override
  List<Object?> get props => [availableForSale, createdAt, handle, id, title, priceRange, images];

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
