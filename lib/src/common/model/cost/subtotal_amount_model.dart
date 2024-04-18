import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtotal_amount_model.g.dart';

@JsonSerializable()
class SubtotalAmountModel extends Equatable {
  const SubtotalAmountModel({
    required this.amount,
    required this.currencyCode,
  });

  final String amount;
  final String currencyCode;

  factory SubtotalAmountModel.fromJson(Map<String, dynamic> json) =>
      _$SubtotalAmountModelFromJson(json);

  @override
  List<Object?> get props => [amount, currencyCode];
}
