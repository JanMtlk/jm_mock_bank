import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/core/universal/jmmb_loader.dart';

class JMMBLoaderPage extends StatelessWidget {
  const JMMBLoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: JMMBLoader(),
      ),
    );
  }
}
