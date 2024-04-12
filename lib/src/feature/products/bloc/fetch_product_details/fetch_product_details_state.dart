part of 'fetch_product_details_bloc.dart';

@freezed
class FetchProductDetailsState with _$FetchProductDetailsState {
  const factory FetchProductDetailsState.initial() = _Initial;

  const factory FetchProductDetailsState.loading({
    final ProductDetailsModel? oldProductDetails,
  }) = _Loading;

  const factory FetchProductDetailsState.success({
    required final ProductDetailsModel productDetails,
  }) = _Success;

  const factory FetchProductDetailsState.failure({
    required final String message,
    final ProductDetailsModel? oldProductDetails,
  }) = _Failure;
}
