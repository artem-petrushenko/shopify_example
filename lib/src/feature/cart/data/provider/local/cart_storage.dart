abstract interface class CartStorage {
  Future<void> addCartId(String cardId);

  String? getCartId();
}
