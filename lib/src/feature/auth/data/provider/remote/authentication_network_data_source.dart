import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

abstract interface class AuthenticationNetworkDataSource {
  Future<CustomerModel> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });
}
