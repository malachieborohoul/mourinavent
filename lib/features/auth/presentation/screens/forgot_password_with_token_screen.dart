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
import 'package:rinavent/features/auth/presentation/screens/test.dart';
import 'package:rinavent/features/auth/presentation/validators/input_validators.dart';

class ForgotPasswordWithTokenScreen extends StatefulWidget {
  final String email;
  const ForgotPasswordWithTokenScreen({super.key, required this.email});

  static route(String email) =>
      PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: ForgotPasswordWithTokenScreen(
            email: email,
          ),
        );
      });

  @override
  State<ForgotPasswordWithTokenScreen> createState() =>
      _ForgotPasswordWithTokenScreenState();
}

class _ForgotPasswordWithTokenScreenState
    extends State<ForgotPasswordWithTokenScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email;
    super.initState();
  }

  final _signInFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
                               padding:
                          EdgeInsets.only(left: 20.h,top: 24.v ),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    showLoaderDialog(context);
                  } else {
                    closeLoaderDialog(context);
                    if (state is AuthFailure) {
                      showSnackBar(context, state.message);
                    } else if (state is AuthSuccess) {
                      Navigator.pushReplacement(context, Test.route());
                      showSnackBar(context, "Welcome back");
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
                          "Forgot Password",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                                                                SizedBox(height: 24.v),

                        Text(
                          "Get your OTP token from your email and enter a new password ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                                                                SizedBox(height: 24.v),

                          CustomTextFormField(
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: appLocalization!.lbl_email_address,
                      hintStyle: theme.textTheme.bodyLarge!,
                      validator: (value) => InputValidators.lastNameValidator(
                          value, appLocalization),
                    ),
                        // const SizedBox(
                        //   height: AppPadding.miniSpacer,
                        // ),
                        // AuthField(
                        //   hintText: "example@gmail.com",
                        //   controller: emailController,
                        //   title: 'Email',
                        //   textInputType: TextInputType.emailAddress,
                        //   codeKey: 2,
                        // ),
                       
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
