import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/signin_screen.dart';

class Test extends StatelessWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const Test(),
        );
      });
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showLoaderDialog(context);
          } else {
            closeLoaderDialog(context);
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthSignOutSuccess) {
              Navigator.pushAndRemoveUntil(
                  context, SigninScreen.route(), (route) => false);
            }
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('TEST'),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthSignOut());
                    },
                    child: const Text("Signout"))
              ],
            ),
          );
        },
      ),
    );
  }
}
