import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/products/model/variant_price_model.dart';

part 'price_range_model.g.dart';

@JsonSerializable()
class PriceRangeModel extends Equatable {
  final VariantPriceModel maxVariantPrice;
  final VariantPriceModel minVariantPrice;

  const PriceRangeModel({
    required this.maxVariantPrice,
    required this.minVariantPrice,
  });

  @override
  List<Object> get props => [maxVariantPrice, minVariantPrice];

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeModelFromJson(json);
}
