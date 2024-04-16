import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.g.dart';

abstract class CustomerModel {
  const CustomerModel();

  factory CustomerModel.notAuthenticated() => const NotAuthenticatedUser();

  factory CustomerModel.authenticated({
    required final String id,
    required final String createdAt,
    required final String email,
    required final String displayName,
    required final String firstName,
    required final String lastName,
  }) =>
      AuthenticatedCustomerModel(
        id: id,
        createdAt: createdAt,
        email: email,
        displayName: displayName,
        firstName: firstName,
        lastName: lastName,
      );

  bool get isAuthenticated;

  bool get isNotAuthenticated;

  T when<T extends Object?>({
    required final T Function(AuthenticatedCustomerModel user) authenticated,
    required final T Function() notAuthenticated,
  });
}

@JsonSerializable()
class AuthenticatedCustomerModel implements CustomerModel {
  const AuthenticatedCustomerModel({
    required this.id,
    required this.createdAt,
    required this.email,
    required this.displayName,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String createdAt;
  final String email;
  final String displayName;
  final String firstName;
  final String lastName;

  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => id.isEmpty;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedCustomerModel user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      authenticated(this);

  @override
  String toString() => 'CustomerModel('
      'id: $id, ';
      // 'createdAt: $createdAt, '
      // 'email: $email, '
      // 'displayName: $displayName, '
      // 'firstName: $firstName, '
      // 'lastName: $lastName, )';

  @override
  bool operator ==(final Object other) =>
      other is AuthenticatedCustomerModel && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory AuthenticatedCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedCustomerModelFromJson(json);
}

@immutable
class NotAuthenticatedUser implements CustomerModel {
  @literal
  const NotAuthenticatedUser();

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedCustomerModel user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      notAuthenticated();

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(final Object other) => other is NotAuthenticatedUser;

  @override
  int get hashCode => 0;
}
