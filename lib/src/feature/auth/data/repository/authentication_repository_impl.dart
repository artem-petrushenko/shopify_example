import 'package:shopify_example/src/feature/auth/data/provider/local/session_storage.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/authentication_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/data/repository/authentication_repository.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({
    required final AuthenticationNetworkDataSource networkDataSource,
    required final SessionStorage sessionStorage,
  })  : _networkDataSource = networkDataSource,
        _sessionStorage = sessionStorage;

  final AuthenticationNetworkDataSource _networkDataSource;
  final SessionStorage _sessionStorage;

  @override
  Future<CustomerModel> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  }) async {
    final token = await _networkDataSource.createAccessToken(
      email: email,
      password: password,
    );
    final customer = await _networkDataSource.signInWithAccessToken(
      customerAccessToken: token,
    );

    /// Save the access token to the session storage if the sign in is successful
    await _sessionStorage.saveAccessToken(token.accessToken);
    return customer;
  }

  @override
  Future<void> logOut() async {
    final accessToken = _sessionStorage.getAccessToken();
    await _networkDataSource.logOut(customerAccessToken: accessToken ?? '');
    await _sessionStorage.cleanSession();
  }
}
