import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String title;
  final String id;

  const ProductModel({
    required this.title,
    required this.id,
  });

  @override
  List<Object?> get props => [id, title];

  static ProductModel fromGraphJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['node']?['id'] ?? '',
      title: json['node']?['title'] ?? '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
