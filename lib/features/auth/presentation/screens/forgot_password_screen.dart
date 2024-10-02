import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/core/common/widgets/auth_field.dart';
import 'package:rinavent/features/auth/presentation/screens/forgot_password_with_token_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const ForgotPasswordScreen(),
        );
      });
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    showLoaderDialog(context);
                  } else {
                    closeLoaderDialog(context);
                    if (state is AuthFailure) {
                      showSnackBar(context, state.message);
                    } else if (state is AuthForgotPasswordSuccess) {
                      showSnackBar(context, "An email has been sent with token");
                      Navigator.push(context, ForgotPasswordWithTokenScreen.route(emailController.text), );
                      
                    }
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        Text(
                          "Forgot Password",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        Text(
                          "Enter your Email ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        AuthField(
                          hintText: "example@gmail.com",
                          controller: emailController,
                          title: 'Email',
                          textInputType: TextInputType.emailAddress,
                          codeKey: 2,
                        ),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        CustomButton(
                            buttonText: "Reset Password",
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(AuthForgotPassword(
                                      email: emailController.text.trim(),
                                    ));
                              }
                            }),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
