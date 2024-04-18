import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

part 'merchandise_model.g.dart';

@JsonSerializable()
class MerchandiseModel extends Equatable {
  final String id;
  final ProductModel product;

  const MerchandiseModel({
    required this.id,
    required this.product,
  });

  factory MerchandiseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchandiseModelFromJson(json);

  @override
  List<Object?> get props => [id, product];
}
