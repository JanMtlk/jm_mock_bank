import 'package:flutter/material.dart';

class JmmForwardIcon extends StatelessWidget {
  final double? size;
  final bool isOppened;
  const JmmForwardIcon({super.key, this.size, this.isOppened = false});

  @override
  Widget build(BuildContext context) {
    return Icon(
      isOppened
          ? Icons.keyboard_arrow_down_sharp
          : Icons.arrow_forward_ios_sharp,
      color: Colors.purple,
      size: (size ?? 20) + (isOppened ? 10 : 0),
    );
  }
}
