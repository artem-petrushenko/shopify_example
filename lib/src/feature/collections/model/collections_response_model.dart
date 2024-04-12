import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/collections/model/collection_list_model.dart';

part 'collections_response_model.g.dart';

@JsonSerializable()
class CollectionsResponseModel extends Equatable {
  final CollectionListModel collections;

  const CollectionsResponseModel({
    required this.collections,
  });

  @override
  List<Object?> get props => [collections];

  factory CollectionsResponseModel.fromJson(Map<String, dynamic> json) => _$CollectionsResponseModelFromJson(json);
}
