import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jm_mock_bank/application/blocks/initial_loading/initial_loading_bloc.dart';
import 'package:jm_mock_bank/application/blocks/initial_loading/initial_loading_event.dart';
import 'package:jm_mock_bank/presentation/error_page.dart';
import 'package:jm_mock_bank/presentation/login_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialLoadingBloc, InitialLoadingState>(
      bloc: InitialLoadingBloc()..add(const InitialLoadingStarted()),
      builder: (context, state) {
        if (state is InitialLoadingLoaded) {
          return const LoginPage();
        }
        if (state is InitialLoadingLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const ErrorPage();
        }
      },
    );
  }
}
