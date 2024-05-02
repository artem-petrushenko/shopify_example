import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/feature/auth/model/mailing_address_model.dart';

part 'mailing_address_list_model.g.dart';

@JsonSerializable()
class MailingAddressListModel extends Equatable {
  @JsonKey(name: 'nodes')
  final List<MailingAddressModel> mailingAddresses;

  const MailingAddressListModel({
    required this.mailingAddresses,
  });

  factory MailingAddressListModel.fromJson(Map<String, dynamic> json) =>
      _$MailingAddressListModelFromJson(json);

  @override
  List<Object?> get props => [mailingAddresses];
}
