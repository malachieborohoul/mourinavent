import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: title,
    );
  }
}
