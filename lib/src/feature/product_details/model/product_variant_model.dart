import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_variant_model.g.dart';

@JsonSerializable()
class ProductVariantModel extends Equatable {
  final bool availableForSale;
  final String id;
  final String title;

  const ProductVariantModel({
    required this.availableForSale,
    required this.id,
    required this.title,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);

  @override
  List<Object?> get props => [availableForSale, id, title];
}
