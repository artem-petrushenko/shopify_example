import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/auth/data/repository/authentication_repository.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required final AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const _Loading()) {
    on<AuthenticationEvent>(
      (event, emit) => event.map(
        signInWithEmailAndPassword: (event) =>
            _onSignInWithEmailAndPassword(event, emit),
        logOut: (event) => _onLogOut(event, emit),
      ),
    );
  }

  final AuthenticationRepository _authenticationRepository;

  bool get isLoading => state.maybeMap(
        authenticated: (_) => false,
        notAuthenticated: (_) => false,
        orElse: () => true,
      );

  Future<void> _onSignInWithEmailAndPassword(
    _SignInWithEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const _Loading());
      final customer =
          await _authenticationRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(_Success(customer: customer));
    } on Object catch (error) {
      emit(_Failure(message: error.toString()));
    } finally {
      emit(
        state.customer.when<AuthenticationState>(
          authenticated: (customer) => _Authenticated(customer: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    }
  }

  Future<void> _onLogOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const _Loading());
      await _authenticationRepository.logOut();
      emit(const _Success());
    } on Object catch (error) {
      emit(_Failure(message: error.toString()));
    } finally {
      emit(
        state.customer.when<AuthenticationState>(
          authenticated: (customer) => _Authenticated(customer: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    }
  }
}
