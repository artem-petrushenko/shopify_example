part of 'fetch_collection_bloc.dart';

@freezed
class FetchCollectionState with _$FetchCollectionState {
  const factory FetchCollectionState.initial() = _Initial;

  const factory FetchCollectionState.loading({
    @Default([]) final List<ProductModel> oldProducts,
  }) = _Loading;

  const factory FetchCollectionState.success({
    required final List<ProductModel> products,
  }) = _Success;

  const factory FetchCollectionState.empty() = _Empty;

  const factory FetchCollectionState.failure({
    required final String message,
    @Default([]) final List<ProductModel> oldProducts,
  }) = _Failure;
}
