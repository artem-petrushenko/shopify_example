
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector_product_configuration_state.dart';
part 'selector_product_configuration_cubit.freezed.dart';

class SelectorProductConfigurationCubit extends Cubit<SelectorProductConfigurationState> {
  SelectorProductConfigurationCubit() : super(const SelectorProductConfigurationState());

  void changeConfiguration(int index) =>
    emit(state.copyWith(selectedIndex: index));
}
