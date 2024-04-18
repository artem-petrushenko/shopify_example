import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_amount_model.g.dart';

@JsonSerializable()
class TotalAmountModel extends Equatable {
  final String amount;
  final String currencyCode;

  const TotalAmountModel({
    required this.amount,
    required this.currencyCode,
  });


  factory TotalAmountModel.fromJson(Map<String, dynamic> json) =>
      _$TotalAmountModelFromJson(json);

  @override
  List<Object?> get props => [amount, currencyCode];
}