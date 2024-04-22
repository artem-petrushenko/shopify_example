part of 'fetch_product_recommendations_bloc.dart';

@freezed
class FetchProductRecommendationsState with _$FetchProductRecommendationsState {
  const factory FetchProductRecommendationsState.initial() = _Initial;

  const factory FetchProductRecommendationsState.loading({
    @Default([]) final List<ProductRecommendationsModel> oldProducts,
}) = _Loading;

  const factory FetchProductRecommendationsState.success({
    required final List<ProductRecommendationsModel> products,
  }) = _Success;

  const factory FetchProductRecommendationsState.failure({
    required final String message,
    @Default([]) final List<ProductRecommendationsModel> oldProducts,
  }) = _Failure;
}
