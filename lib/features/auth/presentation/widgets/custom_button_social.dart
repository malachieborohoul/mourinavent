import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/image_constant.dart';

class CustomButtonSocial extends StatelessWidget {
  final String svgIcon;
  final VoidCallback onPressed;
  const CustomButtonSocial({super.key, required this.svgIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const size = 65.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(size),
          border: Border.all(color: ColorSchemes
                                            .primaryColorScheme.primary, width: 1)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          '${ImageConstant.imagePath}/svgIcon',
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
