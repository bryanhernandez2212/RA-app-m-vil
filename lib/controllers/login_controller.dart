import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_app_m_vil/blocs/login/login_bloc.dart';
import 'package:ra_app_m_vil/blocs/user/user_bloc.dart';
import 'package:ra_app_m_vil/models/user.dart';
import 'package:ra_app_m_vil/providers/db_provider.dart';
import 'package:ra_app_m_vil/utils/validador.dart';


class LoginController {
  final BuildContext context;
  late final LoginBloc bloc;
  late final UserBloc userBloc;

  LoginController({
    required this.context,
  }) {
    bloc = BlocProvider.of<LoginBloc>(
      context,
      listen: false,
    );
    userBloc = BlocProvider.of<UserBloc>(
      context,
      listen: false,
    );
  }
  void email(String value) {
    bloc.add(LoginEmailEvent(email: value));
  }

  String? validarEmail(String value) {
    if (!Validate(value).isEmail()) {
      bloc.add(const LoginErrorEmailEvent(errEmail: 'Correo no valido'));
    } else {
      bloc.add(const LoginErrorEmailEvent(errEmail: ''));
    }
    return null;
  }

  void password(String value) {
    bloc.add(LoginPasswordEvent(password: value));
  }

  bool botonActivo() {
    return bloc.state.errEmail == '' &&
        bloc.state.email != '' &&
        bloc.state.password != '';
  }

  loginUser() async {
    User? user = await DBProvider.db.getUser(bloc.state.email);
    if (user != null && user.password == bloc.state.password) {
      userBloc.add(UserEmailEvent(email: user.email));
      userBloc.add(UserFullNameEvent(fullName: user.fullName));

      if (context.mounted) {
        Navigator.popAndPushNamed(context, 'login');
      }
    } else {
      bloc.add(const LoginMsgEvent(msg: 'Usuario invalido'));
    }
  }

  String? validarPassword(String value) {
    if (value.isEmpty) {
      bloc.add(const LoginMsgPasswordEvent(
          msg: 'El passwod no se pude quedar vacio'));
    } else {
      bloc.add(const LoginMsgPasswordEvent(msg: ''));
    }
    return null;
  }
}
