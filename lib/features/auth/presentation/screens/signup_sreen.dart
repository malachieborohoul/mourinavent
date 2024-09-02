import 'package:flutter/material.dart';
import 'package:mourinavent/core/common/widgets/custom_button.dart';
import 'package:mourinavent/core/contants/padding.dart';
import 'package:mourinavent/core/theme/app_palette.dart';
import 'package:mourinavent/features/auth/presentation/widgets/auth_field.dart';
import 'package:mourinavent/features/auth/presentation/widgets/custom_button_social.dart';

class SignupSreen extends StatefulWidget {
  const SignupSreen({super.key});

  @override
  State<SignupSreen> createState() => _SignupSreenState();
}

class _SignupSreenState extends State<SignupSreen> {
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
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      RichText(
                          text: TextSpan(
                              text: "Agree with ",
                              style: Theme.of(context).textTheme.bodySmall,
                              children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: AppPalette.gradient1,
                                  decoration: TextDecoration.underline),
                            )
                          ]))
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
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
                  
                  RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
                              children: [
                            TextSpan(
                              text: "Sign In",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppPalette.gradient1,
                                  decoration: TextDecoration.underline),
                            )
                          ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
