import 'package:flutter/material.dart';

class LuoScaffold extends StatelessWidget {
  const LuoScaffold({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
