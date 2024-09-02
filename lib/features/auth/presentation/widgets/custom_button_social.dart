import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mourinavent/core/contants/constants.dart';
import 'package:mourinavent/core/theme/app_palette.dart';

class CustomButtonSocial extends StatelessWidget {
  final String svgIcon;
  const CustomButtonSocial({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    const size = 65.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: AppPalette.backgroundColor,
          borderRadius: BorderRadius.circular(size),
          border: Border.all(color: AppPalette.borderColor, width: 1)),
      child: SvgPicture.asset(
        Constants.assetImg + svgIcon,
        fit: BoxFit.none,
      ),
    );
  }
}
