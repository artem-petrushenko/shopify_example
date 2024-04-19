part of 'fetch_product_recommendations_bloc.dart';

@freezed
class FetchProductRecommendationsEvent with _$FetchProductRecommendationsEvent {
  const factory FetchProductRecommendationsEvent.fetchProductRecommendations() = _FetchProductRecommendations;
}
