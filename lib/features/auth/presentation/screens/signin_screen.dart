import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/l10n/app_localizations.dart';
import 'package:rinavent/core/presentation/widgets/custom_elevated_button.dart';
import 'package:rinavent/core/presentation/widgets/custom_text_form_field.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/loader_dialog.dart';
import 'package:rinavent/core/utils/show_snackbar.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rinavent/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:rinavent/features/auth/presentation/screens/signup_screen.dart';
import 'package:rinavent/features/auth/presentation/screens/splash_screen.dart';
import 'package:rinavent/features/auth/presentation/validators/input_validators.dart';
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
    var appLocalization = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.h, top: 24.v),
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
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.v),
                        Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 24.v),
                        Text(
                          "Hi Welcome back, you've been missed ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          hintText: appLocalization!.lbl_email_address,
                          hintStyle: theme.textTheme.bodyLarge!,
                          validator: (value) =>
                              InputValidators.lastNameValidator(
                                  value, appLocalization),
                        ),
                        SizedBox(height: 24.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, ForgotPasswordScreen.route());
                              },
                              child: RichText(
                                  text: TextSpan(
                                text: "Forgot Password",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: ColorSchemes
                                            .primaryColorScheme.primary,
                                        decoration: TextDecoration.underline),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.v),
                        CustomElevatedButton(
                            text: "Reset Password",
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(AuthForgotPassword(
                                      email: emailController.text.trim(),
                                    ));
                              }
                            }),
                        SizedBox(height: 24.v),
                        Text(
                          "Or sign up with",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 24.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CustomButtonSocial(svgIcon: 'apple_logo.svg', onPressed: () {  },),
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
                        SizedBox(height: 24.v),
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
                                                                                 color: ColorSchemes.primaryColorScheme.primary,

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
