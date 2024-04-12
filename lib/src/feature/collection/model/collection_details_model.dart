import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/collections/model/collection_model.dart';
import 'package:shopify_example/src/feature/collection/model/product_list_model.dart';

part 'collection_details_model.g.dart';

@JsonSerializable()
class CollectionDetailsModel extends CollectionModel {
  final ProductListModel products;

  const CollectionDetailsModel({
    required this.products,
    required super.id,
    required super.title,
    super.handle,
  });

  @override
  List<Object?> get props => [super.props, products];

  factory CollectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsModelFromJson(json);
}
