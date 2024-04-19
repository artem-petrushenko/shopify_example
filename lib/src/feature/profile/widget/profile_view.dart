import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/auth/bloc/authentication/authentication_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEvent.logOut()),
            child: const Text('Log Out'),
          ),
        ),
      );
}
