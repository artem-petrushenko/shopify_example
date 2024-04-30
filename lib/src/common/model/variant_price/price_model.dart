import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shopify_example/src/core/utils/price_converter/price_converter.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel extends Equatable {
  static NumberFormat? priceFormat;
  final String amount;
  final String currencyCode;

  const PriceModel({
    required this.amount,
    required this.currencyCode,
  });

  @override
  List<Object?> get props => [amount, currencyCode];

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  String formattedPriceWithLocale({String? locale}) =>
      PriceConverter.chooseRightOrderOnCurrencySymbol(
        amount,
        currencyCode,
        priceFormat: priceFormat,
        locale: (locale != null && locale.isEmpty) ? null : locale,
      );
}
