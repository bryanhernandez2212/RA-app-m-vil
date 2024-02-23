import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_app_m_vil/blocs/login/login_bloc.dart';
import 'package:ra_app_m_vil/blocs/registrar/registrar_bloc.dart';
import 'package:ra_app_m_vil/blocs/user/user_bloc.dart';
import 'package:ra_app_m_vil/screens/login.dart';
import 'package:ra_app_m_vil/screens/registrar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => RegistrarBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => LoginBloc()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'login',
            routes: {
              'login': (_) => const Login(),
              'registrar': (_) => const Registrar(),
            }));
  }
}
