part of 'cart_items_bloc.dart';

@freezed
class CartItemsEvent with _$CartItemsEvent {
  const factory CartItemsEvent.fetchItems({
    final Completer? completer,
  }) = _FetchItems;
}
