import 'dart:io';

import 'package:devtools_test/presentation/auth/bloc/auth_bloc.dart';
import 'package:devtools_test/presentation/initial/bloc/initial_bloc.dart';
import 'package:devtools_test/presentation/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router_service.dart';
import 'injectors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
        }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black),
      );
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
    providers: [
      BlocProvider<InitialBloc>(create: (BuildContext context) => InitialBloc(
          repository: getIt(),
      ),),
      BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc(
          repository: getIt(),
      ),),
      BlocProvider<MainBloc>(create: (BuildContext context) => MainBloc(
          repository: getIt(),
      ),),
    ], child: MaterialApp.router(
      routerConfig: getIt.get<RouterService>().appRouter.config(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}