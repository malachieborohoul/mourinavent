import 'package:flutter/material.dart';
import 'package:mourinavent/core/theme/theme.dart';
import 'package:mourinavent/features/auth/presentation/screens/signup_sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mourinavent",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const SignupSreen(),
    );
  }
}