import 'package:shopify_example/src/feature/auth/data/provider/local/session_storage.dart';
import 'package:shopify_example/src/feature/auth/data/provider/remote/customer_network_data_source.dart';
import 'package:shopify_example/src/feature/auth/data/repository/customer_repository.dart';
import 'package:shopify_example/src/feature/auth/model/customer_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_list_model.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

final class CustomerRepositoryImpl implements CustomerRepository {
  const CustomerRepositoryImpl({
    required final CustomerNetworkDataSource customerNetworkDataSource,
    required final SessionStorage sessionStorage,
  })  : _customerNetworkDataSource = customerNetworkDataSource,
        _sessionStorage = sessionStorage;

  final CustomerNetworkDataSource _customerNetworkDataSource;
  final SessionStorage _sessionStorage;

  @override
  Future<List<MailingAddressModel>> getCustomerAddresses({
    required final int first,
    final String? after,
  }) async {
    final response = await _fetchAuthenticatedData<MailingAddressListModel>(
      fetch: (accessToken) => _customerNetworkDataSource.getCustomerAddresses(
        customerAccessToken: accessToken,
        first: first,
        after: after,
      ),
    );
    return response?.mailingAddresses ?? [];
  }

  @override
  Future<MailingAddressModel?> getCustomerDefaultAddress() async {
    final response = await _fetchAuthenticatedData<MailingAddressModel?>(
      fetch: (accessToken) =>
          _customerNetworkDataSource.getCustomerDefaultAddress(
        customerAccessToken: accessToken,
      ),
    );
    return response;
  }

  @override
  Future<CustomerModel?> getSignedInCustomer() async {
    final response = await _fetchAuthenticatedData<CustomerModel?>(
      fetch: (accessToken) => _customerNetworkDataSource.getCustomer(
        customerAccessToken: accessToken,
      ),
    );
    return response;
  }

  Future<T?> _fetchAuthenticatedData<T>({
    required final Future<T> Function(String) fetch,
  }) async {
    final accessToken = _sessionStorage.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      return fetch(accessToken);
    }
    return null;
  }
}
