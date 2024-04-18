part of 'changed_cart_bloc.dart';

@freezed
class ChangedCartState with _$ChangedCartState {
  const factory ChangedCartState.initial() = _Initial;

  const factory ChangedCartState.loading() = _Loading;

  const factory ChangedCartState.success() = _Success;

  const factory ChangedCartState.failure({
    required final String message,
  }) = _Failure;
}
