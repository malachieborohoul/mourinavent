import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/signup_screen.dart';
import 'package:rinavent/features/auth/presentation/widgets/auth_field.dart';
import 'package:rinavent/features/auth/presentation/widgets/custom_button_social.dart';

class SigninScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SigninScreen(),
        );
      });
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
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
                          "Sign In",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        Text(
                          "Hi Welcome back, you've been missed ",
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
                          height: AppPadding.miniSpacer,
                        ),
                        AuthField(
                          hintText: "***************",
                          controller: passwordController,
                          title: 'Password',
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          codeKey: 3,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                                text: TextSpan(
                              text: "Forgot Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: AppPalette.gradient1,
                                      decoration: TextDecoration.underline),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        CustomButton(buttonText: "Sign In", onPressed: () {
                            if (_signInFormKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(AuthSignIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    ));
                              }
                        }),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        Text(
                          "Or sign up with",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButtonSocial(svgIcon: 'apple_logo.svg', onPressed: () {  },),
                            const SizedBox(
                              width: AppPadding.miniSpacer,
                            ),
                            CustomButtonSocial(svgIcon: 'google_logo.svg', onPressed: () {  },),
                          ],
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, SignupSreen.route());
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Don't you have an account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.black),
                                  children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: AppPalette.gradient1,
                                          decoration: TextDecoration.underline),
                                )
                              ])),
                        )
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
