import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/theme_helper.dart';

void showSnackBar(BuildContext context, String content, [Color? backgroundColor]) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content, style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),),behavior: SnackBarBehavior.floating,backgroundColor: backgroundColor, padding: const EdgeInsets.all(20),),);
}
