part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.authenticated({
    required final AuthenticatedCustomerModel customer,
  }) = _Authenticated;

  const factory AuthenticationState.loading({
    @Default(NotAuthenticatedUser()) final CustomerModel customer,
  }) = _Loading;

  const factory AuthenticationState.failure({
    @Default(NotAuthenticatedUser()) final CustomerModel customer,
    required final String message,
  }) = _Failure;

  const factory AuthenticationState.success({
    @Default(NotAuthenticatedUser()) final CustomerModel customer,
  }) = _Success;

  const factory AuthenticationState.notAuthenticated({
    @Default(NotAuthenticatedUser()) final CustomerModel customer,
  }) = _NotAuthenticated;
}
