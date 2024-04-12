import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  final String id;
  final String url;
  final String altText;
  final int height;
  final int width;

  const ImageModel({
    required this.id,
    required this.url,
    required this.altText,
    required this.height,
    required this.width,
  });

  @override
  List<Object> get props => [id, url, altText, height, width];

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
