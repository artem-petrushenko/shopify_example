import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/cost/amount_per_quantity_model.dart';
import 'package:shopify_example/src/common/model/cost/compare_at_amount_per_quantity_model.dart';
import 'package:shopify_example/src/common/model/cost/subtotal_amount_model.dart';
import 'package:shopify_example/src/common/model/cost/total_amount_model.dart';

part 'cost_model.g.dart';

@JsonSerializable()
class CostModel extends Equatable {
  final AmountPerQuantityModel amountPerQuantity;
  final CompareAtAmountPerQuantityModel? compareAtAmountPerQuantity;
  final SubtotalAmountModel subtotalAmount;
  final TotalAmountModel totalAmount;

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
