import 'package:flutter/material.dart';

class JmmForwardIcon extends StatelessWidget {
  final double? size;
  const JmmForwardIcon({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_sharp,
      color: Colors.purple,
      size: size ?? 20,
    );
  }
}
