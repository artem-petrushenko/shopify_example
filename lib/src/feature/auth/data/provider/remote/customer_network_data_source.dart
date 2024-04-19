import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

abstract interface class CustomerNetworkDataSource {
  Future<CustomerModel> getCustomer({
    required final String customerAccessToken,
  });
}