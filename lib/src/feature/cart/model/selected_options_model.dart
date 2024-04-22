import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_options_model.g.dart';

@JsonSerializable()
class SelectedOptionsModel extends Equatable {
  final String name;
  final String value;

  const SelectedOptionsModel({
    required this.name,
    required this.value,
  });

  factory SelectedOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionsModelFromJson(json);

  @override
  List<Object?> get props => [name, value];
}
