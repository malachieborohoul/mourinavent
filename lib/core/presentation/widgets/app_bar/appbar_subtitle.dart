import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/theme_helper.dart';


class AppbarSubtitle extends StatelessWidget {
  const AppbarSubtitle({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
  });

  final String text;

  final EdgeInsetsGeometry? margin;

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ),
    );
  }
}
