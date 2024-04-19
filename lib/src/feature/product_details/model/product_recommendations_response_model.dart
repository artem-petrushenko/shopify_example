import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

part 'product_recommendations_response_model.g.dart';

@JsonSerializable()
class ProductRecommendationsResponseModel extends Equatable {
  const ProductRecommendationsResponseModel({
    required this.productsRecommendations,
  });

  final List<ProductModel> productsRecommendations;

  factory ProductRecommendationsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ProductRecommendationsResponseModelFromJson(json);

  @override
  List<Object?> get props => [productsRecommendations];
}
