import 'package:shopify_example/src/feature/auth/data/provider/remote/authentication_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/data/repository/authentication_repository.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({
    required final AuthenticationNetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  final AuthenticationNetworkDataSource _networkDataSource;

  @override
  Future<CustomerModel> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  }) async =>
      await _networkDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
}
