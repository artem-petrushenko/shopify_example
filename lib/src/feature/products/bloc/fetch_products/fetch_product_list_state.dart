part of 'fetch_product_list_bloc.dart';

@freezed
class FetchProductListState with _$FetchProductListState {
  const factory FetchProductListState.initial() = _Initial;

  const factory FetchProductListState.loading({
    @Default([]) final List<ProductModel> oldProducts,
  }) = _Loading;

  const factory FetchProductListState.success({
    required final List<ProductModel> products,
  }) = _Success;

  const factory FetchProductListState.empty() = _Empty;

  const factory FetchProductListState.failure({
    required final String message,
    @Default([]) final List<ProductModel> oldProducts,
  }) = _Failure;
}
