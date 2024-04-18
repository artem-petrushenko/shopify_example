import 'package:shopify_example/src/core/components/shared_preferences/shared_preferences_dao.dart';
import 'package:shopify_example/src/feature/cart/data/provider/local/cart_storage.dart';

class CartStorageImpl implements CartStorage {
  const CartStorageImpl({
    required final SharedPreferencesDao sharedPreferencesDao,
  }) : _sharedPreferencesDao = sharedPreferencesDao;

  final SharedPreferencesDao _sharedPreferencesDao;

  @override
  Future<void> addCartId(String cardId) async =>
      await _sharedPreferencesDao.updateString('cardId', cardId);

  @override
  String? getCartId() => _sharedPreferencesDao.readString('cardId');
}
