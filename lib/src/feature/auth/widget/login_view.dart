import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/auth/bloc/authentication/authentication_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController()..text = 'petrushenkoartemw@gmail.com';
    _passwordController = TextEditingController()..text = 'StayDown72';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) => AuthenticationBloc(
            authenticationRepository:
                DependenciesScope.of(context).authenticationRepository),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) => current.maybeMap(
            failure: (_) => true,
            orElse: () => false,
          ),
          listener: (context, state) => state.mapOrNull(
            failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Center(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: _emailController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    controller: _passwordController,
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) => ElevatedButton(
                      onPressed: () => context.read<AuthenticationBloc>().add(
                            AuthenticationEvent.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          ),
                      child: const Text('Login'),
                    ),
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder:
                        (BuildContext context, AuthenticationState state) =>
                            state.maybeMap(
                      orElse: () => Text('Empty'),
                      authenticated: (state) => Text('Authenticated'),
                      notAuthenticated: (state) => Text('Unauthenticated'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
