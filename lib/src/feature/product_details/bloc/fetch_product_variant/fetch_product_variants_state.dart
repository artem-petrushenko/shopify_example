part of 'fetch_product_variants_bloc.dart';

@freezed
class FetchProductVariantsState with _$FetchProductVariantsState {
  const factory FetchProductVariantsState.initial() = _Initial;

  const factory FetchProductVariantsState.loading({
    @Default([]) final List<ProductVariantModel> oldVariants,
  }) = _Loading;

  const factory FetchProductVariantsState.success({
    required final List<ProductVariantModel> variants,
  }) = _Success;

  const factory FetchProductVariantsState.failure({
    required final String message,
    @Default([]) final List<ProductVariantModel> oldVariants,
  }) = _Failure;
}
