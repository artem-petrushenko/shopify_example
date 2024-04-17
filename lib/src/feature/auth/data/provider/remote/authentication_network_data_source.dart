import 'package:shopify_example/src/feature/auth/model/customer_access_token_model.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

abstract interface class AuthenticationNetworkDataSource {
  Future<CustomerModel> signInWithAccessToken({
    required final CustomerAccessTokenModel customerAccessToken,
  });

  Future<CustomerAccessTokenModel> createAccessToken({
    required final String email,
    required final String password,
  });

  Future<void> logOut({
    required final String customerAccessToken,
  });
}
