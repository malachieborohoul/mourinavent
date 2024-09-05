import 'package:flutter/material.dart';
import 'package:mourinavent/core/contants/padding.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;
  final int codeKey;

  const AuthField(
      {super.key,
      required this.hintText,
      this.codeKey = 1,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      required this.title});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isVisibility = ValueNotifier(false);
    return ValueListenableBuilder<bool>(
        valueListenable: isVisibility,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: AppPadding.miniSpacer - 10,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.bodySmall,
                keyboardType: textInputType,
                controller: controller,
                obscureText: isPassword
                    ? !isVisibility.value
                        ? true
                        : false
                    : false,
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? IconButton(
                            onPressed: () {
                              isVisibility.value = !isVisibility.value;
                            },
                            icon: isVisibility.value
                                ? const Icon(
                                    Icons.visibility_outlined,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                  ))
                        : null,
                    hintText: hintText),
                validator: (val) {
                  switch (codeKey) {
                    case 1:
                      if (val!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                        return "Please enter a correct Full Name";
                      } else {
                        return null;
                      }

                    case 2:
                      if (val!.isEmpty ||
                          !RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(val)) {
                        return "Please enter a correct Email Adress";
                      } else {
                        return null;
                      }

                    case 3:
                      if (val!.isEmpty || !RegExp(r'.*').hasMatch(val)) {
                        return "Please enter a correct password";
                      } else if (val.length < 8) {
                        return "Please enter at least 8 characters";
                      } else {
                        return null;
                      }

                    default:
                  }
                  return null;
                },
              ),
            ],
          );
        });
  }
}
