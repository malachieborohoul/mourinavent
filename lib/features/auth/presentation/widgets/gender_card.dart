import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      this.icon = Icons.male,
      required this.title,
      required this.onPressed,
      required this.isSelected });
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;
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
            gradient: LinearGradient(colors: [
              isSelected ? AppPalette.gradient1 : AppPalette.borderColor,
              isSelected ? AppPalette.gradient2 : AppPalette.borderColor,
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
                color: isSelected ? Colors.white : Colors.black,
                size: 80,
              ),
              Text(
                title,
                style: isSelected
                    ? Theme.of(context).textTheme.bodyLarge
                    : Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
