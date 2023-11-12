import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/router.dart';
import 'bloc/initial_bloc.dart';

@RoutePage(name: RouteNames.initial)
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    final initialBloc = context.read<InitialBloc>();
    initialBloc.add(const GetTokenEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialBloc, InitialState>(
        listenWhen: (prev, current) => prev.haveToken != current.haveToken,
        listener: (context, state) {
          if (state.haveToken == false) {
            context.router.replace(const AuthRoute());
          } else {
            context.router.replace(const MainRoute());
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
