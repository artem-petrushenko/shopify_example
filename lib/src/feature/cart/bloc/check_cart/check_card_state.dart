part of 'check_card_cubit.dart';

@freezed
class CheckCardState with _$CheckCardState {
  const factory CheckCardState.initial() = _Initial;

  const factory CheckCardState.loading() = _Loading;

  const factory CheckCardState.success({
    required final String cartId,
  }) = _Success;

  const factory CheckCardState.failure({
    required final String message,
  }) = _Failure;
}
