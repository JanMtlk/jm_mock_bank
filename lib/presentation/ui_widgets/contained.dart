import 'package:flutter/material.dart';

class Contained extends StatelessWidget {
  final Widget child;
  const Contained({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
