import 'package:flutter/material.dart';
import 'package:jm_mock_bank/utils/constants.dart';

class JMMBLoader extends StatelessWidget {
  final double size;
  const JMMBLoader({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 8,
        color: MyColors.brightPurpleBG,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
