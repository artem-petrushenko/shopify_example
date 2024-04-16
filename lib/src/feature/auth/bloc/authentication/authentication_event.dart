part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signInWithEmailAndPassword({
    required final String email,
    required final String password,
  }) = _SignInWithEmailAndPassword;
}
