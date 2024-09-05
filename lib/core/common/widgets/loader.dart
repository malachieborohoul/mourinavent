import 'package:flutter/material.dart';
import 'package:mourinavent/core/theme/app_palette.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppPalette.gradient1,),
    );
  }
}