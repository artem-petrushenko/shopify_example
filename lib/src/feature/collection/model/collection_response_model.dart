import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/collection/model/collection_details_model.dart';

part 'collection_response_model.g.dart';

@JsonSerializable()
class CollectionResponseModel extends Equatable {
  final CollectionDetailsModel collection;

  const CollectionResponseModel({
    required this.collection,
  });

  @override
  List<Object?> get props => [collection];

  factory CollectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionResponseModelFromJson(json);
}
