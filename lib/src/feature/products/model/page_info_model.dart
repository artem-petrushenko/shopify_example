import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_info_model.g.dart';

@JsonSerializable()
class PageInfoModel extends Equatable {
  final String endCursor;
  final String startCursor;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PageInfoModel({
    required this.endCursor,
    required this.startCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PageInfoModelFromJson(json);

  @override
  List<Object?> get props => [
        endCursor,
        startCursor,
        hasNextPage,
        hasPreviousPage,
      ];
}
