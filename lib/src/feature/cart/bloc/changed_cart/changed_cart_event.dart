part of 'changed_cart_bloc.dart';

@freezed
class ChangedCartEvent with _$ChangedCartEvent {
  const factory ChangedCartEvent.addItemToCart({
    @Default(1) final int quantity,
    required final String itemId,
  }) = _AddItemToCart;

  const factory ChangedCartEvent.removeItemFromCart({
    required final String itemId,
  }) = _RemoveItemFromCart;

  const factory ChangedCartEvent.updateItemInCart({
    required final int quantity,
    required final String itemId,
  }) = _UpdateItemInCart;
}
