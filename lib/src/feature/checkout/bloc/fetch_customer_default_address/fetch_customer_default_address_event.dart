part of 'fetch_customer_default_address_bloc.dart';

@freezed
sealed class FetchCustomerDefaultAddressEvent with _$FetchCustomerDefaultAddressEvent {
  const factory FetchCustomerDefaultAddressEvent.fetchAddress() = _FetchAddress;
}
