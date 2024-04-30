part of 'fetch_cart_cost_bloc.dart';

@freezed
class FetchCartCostEvent with _$FetchCartCostEvent {
  const factory FetchCartCostEvent.fetchCartCost({
    final Completer? completer,
  }) = _FetchCartCost;
}
