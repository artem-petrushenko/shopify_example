import 'package:shopify_example/src/feature/auth/model/customer_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_list_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

abstract interface class CustomerNetworkDataSource {
  Future<CustomerModel> getCustomer({
    required final String customerAccessToken,
  });

  Future<MailingAddressListModel> getCustomerAddresses({
    required final String customerAccessToken,
    required final int first,
    final String? after,
  });

  Future<MailingAddressModel> getCustomerDefaultAddress({
    required final String customerAccessToken,
  });
}
