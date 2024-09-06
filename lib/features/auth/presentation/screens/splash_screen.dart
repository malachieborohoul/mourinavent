import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mourinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mourinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mourinavent/features/auth/presentation/screens/signin_screen.dart';
import 'package:mourinavent/features/auth/presentation/screens/test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserLoggedIn;
      },
      builder: (context, isLoggedIn) {
        if (isLoggedIn) {
          return const Test();
        }
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              // L'utilisateur a réussi à s'authentifier
              Navigator.pushReplacement(context, Test.route());
            } else if (state is AuthFailure || state is AuthInitial) {
              // L'utilisateur n'est pas authentifié, redirection vers la page de connexion
              Navigator.pushReplacement(
                context,
                SigninScreen.route(),
              );
            }
          },
          child: Center(
            child: Image.asset('assets/logo.png'),
          ),
        );
      },
    ));
  }
}
