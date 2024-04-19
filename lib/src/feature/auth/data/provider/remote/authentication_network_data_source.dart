import 'package:shopify_example/src/feature/auth/model/customer_access_token_model.dart';

abstract interface class AuthenticationNetworkDataSource {
  Future<CustomerAccessTokenModel> createAccessToken({
    required final String email,
    required final String password,
  });

  Future<void> logOut({
    required final String customerAccessToken,
  });
}
