import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/widgets/custom_button.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/signin_screen.dart';
import 'package:rinavent/core/common/widgets/auth_field.dart';
import 'package:rinavent/features/auth/presentation/screens/splash_screen.dart';
import 'package:rinavent/features/auth/presentation/widgets/custom_button_social.dart';

class SignupSreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SignupSreen(),
        );
      });
  const SignupSreen({super.key});

  @override
  State<SignupSreen> createState() => _SignupSreenState();
}

class _SignupSreenState extends State<SignupSreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
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
                    } else if (state is AuthSuccess) {
                      Navigator.pushAndRemoveUntil(
                          context, SplashScreen.route(), (route) => false);
                    }
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        Text(
                          "Create Account",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        Column(
                          children: [
                            Text(
                              "Fill your information below or register ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "with your social account",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        AuthField(
                          hintText: "Borohoul Soguelni Malachie",
                          controller: nameController,
                          title: 'Name',
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        AuthField(
                          hintText: "example@gmail.com",
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          title: 'Email',
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
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            RichText(
                                text: TextSpan(
                                    text: "Agree with ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    children: [
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: AppPalette.gradient1,
                                            decoration:
                                                TextDecoration.underline),
                                  )
                                ]))
                          ],
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        CustomButton(
                            buttonText: "Sign Up",
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();

                                context.read<AuthBloc>().add(AuthSignUp(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    name: nameController.text.trim()));
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
                            // CustomButtonSocial(
                            //   svgIcon: 'apple_logo.svg',
                            //   onPressed: () {
                            //      context
                            //         .read<AuthBloc>()
                            //         .add(AuthSignUpWithApple());
                            //   },
                            // ),
                            // const SizedBox(
                            //   width: AppPadding.miniSpacer,
                            // ),
                            CustomButtonSocial(
                              svgIcon: 'google_logo.svg',
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthSignUpWithGoogle());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, SigninScreen.route());
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Already have an account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.black),
                                  children: [
                                TextSpan(
                                  text: "Sign In",
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
