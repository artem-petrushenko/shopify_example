part of 'fetch_cart_cost_bloc.dart';

@freezed
class FetchCartCostState with _$FetchCartCostState {
  const factory FetchCartCostState.initial() = _Initial;

  const factory FetchCartCostState.loading({
    final CartCostModel? cost,
  }) = _Loading;

  const factory FetchCartCostState.success({
    required final CartCostModel cost,
  }) = _Success;

  const factory FetchCartCostState.failure({
    required final String message,
    final CartCostModel? cost,
  }) = _Failure;
}
