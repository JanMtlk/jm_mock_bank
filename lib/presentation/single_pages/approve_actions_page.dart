import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/approve_actions/approve_actions_controller.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class ApproveActionsPage extends StatefulWidget {
  const ApproveActionsPage({super.key});

  @override
  State<ApproveActionsPage> createState() => _ApproveActionsPageState();
}

class _ApproveActionsPageState extends State<ApproveActionsPage> {
  final ApproveActionsController _approveActionsController = Get.put(
    ApproveActionsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JMM Key"),
      ),
      body: GetBuilder(
        init: _approveActionsController,
        builder: (controller) {
          if (controller.approveActionsState is ApproveActionsLoaded) {
            final List<String> approveActions =
                (controller.approveActionsState as ApproveActionsLoaded)
                    .actionsList;
            return Column(
              children: [
                const SizedBox(height: 20),
                Text("Actions to approve: ${approveActions.length}"),
                const SizedBox(height: 20),
                Expanded(
                  child: Column(children: [
                    Expanded(
                        child: Center(
                      child: approveActions.isNotEmpty
                          ? // display the firs index name
                          Text(approveActions[0])
                          : const Text("No actions to approve"),
                    )),
                    if (approveActions.isNotEmpty)
                      Contained(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: const Text('Accept'),
                              onPressed: () {
                                // remove the first index
                                controller.acceptAction(approveActions[0]);
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Reject'),
                              onPressed: () {
                                // remove the first index
                                controller.rejectAction(approveActions[0]);
                              },
                            )
                          ],
                        ),
                      )
                  ]),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
