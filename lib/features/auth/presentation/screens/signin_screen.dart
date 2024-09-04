import 'package:flutter/material.dart';
import 'package:mourinavent/core/common/widgets/custom_button.dart';
import 'package:mourinavent/core/contants/padding.dart';
import 'package:mourinavent/core/theme/app_palette.dart';
import 'package:mourinavent/features/auth/presentation/screens/signup_screen.dart';
import 'package:mourinavent/features/auth/presentation/widgets/auth_field.dart';
import 'package:mourinavent/features/auth/presentation/widgets/custom_button_social.dart';

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
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding),
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
                    controller: nameController,
                    title: 'Email',
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
                  ),
                  AuthField(
                    hintText: "***************",
                    controller: nameController,
                    title: 'Password',
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppPalette.gradient1,
                            decoration: TextDecoration.underline),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer,
                  ),
                  CustomButton(buttonText: "Sign Up", onPressed: () {}),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonSocial(svgIcon: 'apple_logo.svg'),
                      SizedBox(
                        width: AppPadding.miniSpacer,
                      ),
                      CustomButtonSocial(svgIcon: 'google_logo.svg'),
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
            ),
          ),
        ),
      ),
    );
  }
}
