import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel extends Equatable {
  final String id;
  final String? handle;
  final String title;

  const CollectionModel({
    required this.id,
    this.handle,
    required this.title,
  });

  @override
  List<Object?> get props => [id, handle, title];

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
}
