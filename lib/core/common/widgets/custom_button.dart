import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
       return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppPalette.gradient1,
            AppPalette.gradient2,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(25)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPalette.transparentColor,
              shadowColor: AppPalette.transparentColor,
              fixedSize: const Size(
                395,
                55,
              )),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style:  Theme.of(context).textTheme.titleMedium,
          )),
    );
  
  }
}