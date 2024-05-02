import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mailing_address_model.g.dart';

@JsonSerializable()
class MailingAddressModel extends Equatable {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? address1;
  final String? address2;
  final String? city;
  final String? country;
  final String? countryCodeV2;
  final String? phone;
  final String? zip;
  final String? formattedArea;
  final String? name;

  const MailingAddressModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.countryCodeV2,
    this.phone,
    this.zip,
    this.formattedArea,
    this.name,
  });

  factory MailingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$MailingAddressModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        company,
        address1,
        address2,
        city,
        country,
        countryCodeV2,
        phone,
        zip,
        formattedArea,
        name,
      ];
}
