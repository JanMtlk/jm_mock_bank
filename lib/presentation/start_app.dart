import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jm_mock_bank/application/blocks/approve_actions/approve_actions_bloc.dart';
import 'package:jm_mock_bank/application/blocks/auth_state/auth_state_bloc.dart';
import 'package:jm_mock_bank/application/blocks/initial_loading/initial_loading_bloc.dart';
import 'package:jm_mock_bank/presentation/initial_page.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InitialLoadingBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ApproveActionsBloc(),
        ),
      ],
      child: const InitialPage(),
    );
  }
}
