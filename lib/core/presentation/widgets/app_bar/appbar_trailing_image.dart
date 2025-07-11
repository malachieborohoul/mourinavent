import 'package:flutter/material.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:rinavent/core/presentation/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarTrailingImage extends StatelessWidget {
  const AppbarTrailingImage({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
  });

  final String? imagePath;

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
        child: CustomImageView(
          imagePath: imagePath,
          height: 32.adaptSize,
          width: 32.adaptSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
