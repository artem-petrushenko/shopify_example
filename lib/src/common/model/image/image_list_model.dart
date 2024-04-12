import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/common/model/image/image_model.dart';

part 'image_list_model.g.dart';

@JsonSerializable()
class ImageListModel extends Equatable {
  @JsonKey(name: 'nodes')
  final List<ImageModel> images;

  const ImageListModel({required this.images});

  @override
  List<Object> get props => [images];

  factory ImageListModel.fromJson(Map<String, dynamic> json) =>
      _$ImageListModelFromJson(json);
}
