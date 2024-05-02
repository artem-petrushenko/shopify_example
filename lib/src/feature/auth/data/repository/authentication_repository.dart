import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

abstract interface class AuthenticationRepository {
  Future<CustomerModel> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  // TODO: Maybe this moved to CustomerRepository?
  Future<CustomerModel?> getSignedInCustomer();

  Future<void> logOut();
}