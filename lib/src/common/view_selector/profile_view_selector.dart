import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/auth/bloc/authentication/authentication_bloc.dart';
import 'package:shopify_example/src/feature/auth/widget/login_view.dart';
import 'package:shopify_example/src/feature/profile/widget/profile_view.dart';

class ProfileViewSelector extends StatelessWidget {
  const ProfileViewSelector({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) => state.customer.when(
          authenticated: (customer) => const ProfileView(),
          notAuthenticated: () => const LoginView(),
        ),
      );
}
