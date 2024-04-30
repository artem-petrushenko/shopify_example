import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/variant_price/price_model.dart';

part 'cost_model.g.dart';

@JsonSerializable()
class CostModel extends Equatable {
  final PriceModel amountPerQuantity;
  final PriceModel? compareAtAmountPerQuantity;
  final PriceModel subtotalAmount;
  final PriceModel totalAmount;

  const CostModel({
    required this.amountPerQuantity,
    this.compareAtAmountPerQuantity,
    required this.subtotalAmount,
    required this.totalAmount,
  });

  factory CostModel.fromJson(Map<String, dynamic> json) =>
      _$CostModelFromJson(json);

  @override
  List<Object?> get props => [
        amountPerQuantity,
        compareAtAmountPerQuantity,
        subtotalAmount,
        totalAmount,
      ];
}
