import 'package:flutter/material.dart';
import 'package:mourinavent/core/contants/padding.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscureText = false,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:  Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: AppPadding.miniSpacer-10,
        ),
        TextFormField(
          controller: controller,
          obscureText: isObscureText,
          decoration: InputDecoration(hintText: hintText),
          validator: (value) {
            if (value!.isEmpty) {
              return "$hintText is missing!";
            }
            return null;
          },
        ),
      ],
    );
  }
}
