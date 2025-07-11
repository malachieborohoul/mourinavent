import 'package:flutter/material.dart';
import 'package:rinavent/core/utils/size_utils.dart';
import 'package:rinavent/core/presentation/widgets/custom_image_view.dart';
@immutable
class AppbarLeadingImage extends StatelessWidget {
  const AppbarLeadingImage({
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
          height: 24.h,
          width: 24.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
