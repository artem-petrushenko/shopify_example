import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/variant_price/price_model.dart';

part 'discount_allocations_model.g.dart';

@JsonSerializable()
class DiscountAllocationsModel extends Equatable {
  final String title;
  final PriceModel discountedAmount;

  const DiscountAllocationsModel({
    required this.title,
    required this.discountedAmount,
  });

  @override
  List<Object?> get props => [title, discountedAmount];

  factory DiscountAllocationsModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountAllocationsModelFromJson(json);
}
