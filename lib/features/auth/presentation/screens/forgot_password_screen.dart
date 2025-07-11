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
import 'package:rinavent/features/auth/presentation/screens/forgot_password_with_token_screen.dart';
import 'package:rinavent/features/auth/presentation/validators/input_validators.dart';

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
    var appLocalization = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
            width: SizeUtils.width,

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
                                          SizedBox(height: 24.v),

                          Text(
                            "Forgot Password",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                                          SizedBox(height: 24.v),

                          Text(
                            "Enter your Email ",
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
                      
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
