import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      this.icon = Icons.male,
      required this.title,
      required this.onPressed});
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = width * 0.4;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Container(
        height: size,
        width: size,
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
            padding: EdgeInsets.zero,
          ),
          onPressed: onPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 80,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
