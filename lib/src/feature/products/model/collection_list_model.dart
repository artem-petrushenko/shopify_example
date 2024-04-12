import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopify_example/src/feature/products/model/collection_model.dart';

part 'collection_list_model.g.dart';

@JsonSerializable()
class CollectionListModel extends Equatable {
  @JsonKey(name: 'nodes')
  final List<CollectionModel> collections;

  const CollectionListModel({
    required this.collections,
  });

  @override
  List<Object> get props => [collections];

  factory CollectionListModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionListModelFromJson(json);
}
