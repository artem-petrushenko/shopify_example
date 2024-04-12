part of 'fetch_product_details_bloc.dart';

@freezed
class FetchProductDetailsEvent with _$FetchProductDetailsEvent {
  const factory FetchProductDetailsEvent.fetchProductDetails({
    final Completer? completer,
  }) = _FetchProductDetails;
}
