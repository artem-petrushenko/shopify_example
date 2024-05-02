import 'package:shopify_example/src/feature/auth/model/customer_model.dart';

import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

abstract interface class CustomerRepository {
  Future<CustomerModel?> getSignedInCustomer();

  Future<List<MailingAddressModel>> getCustomerAddresses({
    required final int first,
    final String? after,
  });

  Future<MailingAddressModel?> getCustomerDefaultAddress();
}
