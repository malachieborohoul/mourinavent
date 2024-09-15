import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed,  this.primaryColor=AppPalette.gradient1,  this.secondaryColor=AppPalette.gradient2,  this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [
            primaryColor,
            secondaryColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
          )),
    );
  }
}
