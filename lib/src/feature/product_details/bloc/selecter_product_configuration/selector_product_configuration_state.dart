part of 'selector_product_configuration_cubit.dart';

@freezed
class SelectorProductConfigurationState with _$SelectorProductConfigurationState {
  const factory SelectorProductConfigurationState({
    @Default(0) final int selectedIndex,
  }) = _Initial;
}
