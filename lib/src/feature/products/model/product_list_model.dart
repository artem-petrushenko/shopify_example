import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/products/model/page_info_model.dart';
import 'package:shopify_example/src/feature/products/model/product_model.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListModel extends Equatable {
  const ProductListModel({
    required this.products,
    required this.pageInfo,
  });

  @JsonKey(name: 'nodes')
  final List<ProductModel> products;
  final PageInfoModel pageInfo;

  @override
  List<Object> get props => [products, pageInfo];

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
}
