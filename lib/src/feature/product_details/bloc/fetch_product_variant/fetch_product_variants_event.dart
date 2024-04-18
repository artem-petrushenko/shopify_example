part of 'fetch_product_variants_bloc.dart';

@freezed
class FetchProductVariantsEvent with _$FetchProductVariantsEvent {
  const factory FetchProductVariantsEvent.fetchProductVariants({
    final Completer? completer,
  }) = _FetchProductVariants;
}
