part of 'fetch_customer_default_address_bloc.dart';

@freezed
sealed class FetchCustomerDefaultAddressState with _$FetchCustomerDefaultAddressState {
  const factory FetchCustomerDefaultAddressState.initial() = _Initial;

  const factory FetchCustomerDefaultAddressState.loading() = _Loading;

  const factory FetchCustomerDefaultAddressState.success({
    required final MailingAddressModel? address,
  }) = _Success;

  const factory FetchCustomerDefaultAddressState.failure({
    required final String message,
  }) = _Failure;
}
