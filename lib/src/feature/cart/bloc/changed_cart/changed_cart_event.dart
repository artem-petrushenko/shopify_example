part of 'changed_cart_bloc.dart';

@freezed
class ChangedCartEvent with _$ChangedCartEvent {
  const factory ChangedCartEvent.addItemToCart({
    @Default(1) final int quantity,
  }) = _AddItemToCart;

  const factory ChangedCartEvent.removeItemFromCart() = _RemoveItemFromCart;

  const factory ChangedCartEvent.updateItemInCart() = _UpdateItemInCart;
}
