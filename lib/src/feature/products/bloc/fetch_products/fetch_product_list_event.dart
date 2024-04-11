part of 'fetch_product_list_bloc.dart';

@freezed
class FetchProductListEvent with _$FetchProductListEvent {
  const factory FetchProductListEvent.fetchProductList({
    final Completer? completer,
  }) = _FetchProductListEvent;
}
