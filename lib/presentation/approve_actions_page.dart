import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jm_mock_bank/application/blocks/approve_actions/approve_actions_bloc.dart';

class ApproveActionsPage extends StatelessWidget {
  const ApproveActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("JMM Key"),
      ),
      body: BlocBuilder<ApproveActionsBloc, ApproveActionsState>(
        bloc: ApproveActionsBloc()..add(const ApproveActionsInitializeEvent()),
        builder: (context, state) {
          if (state is ApproveActionsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(
                "Welcome to the approve actions page\n ${state.toString()}"),
          );
        },
      ),
    );
  }
}
