import 'package:flutter/material.dart';

class Test extends StatelessWidget {
    static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const Test(),
        );
      });
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('TEST'),),);
  }
}