import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/variant_price/price_model.dart';

part 'product_variant_model.g.dart';

@JsonSerializable()
class ProductVariantModel extends Equatable {
  final bool availableForSale;
  final String id;
  final String title;
  @JsonKey(name: 'compareAtPriceV2')
  final PriceModel? compareAtPrice;
  @JsonKey(name: 'priceV2')
  final PriceModel price;

  const ProductVariantModel({
    required this.availableForSale,
    required this.id,
    required this.title,
    this.compareAtPrice,
    required this.price,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  @override
  List<Object?> get props => [availableForSale, id, title];
}
