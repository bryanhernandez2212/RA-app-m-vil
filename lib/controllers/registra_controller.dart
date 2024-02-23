import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_app_m_vil/blocs/registrar/registrar_bloc.dart';
import 'package:ra_app_m_vil/blocs/user/user_bloc.dart';
import 'package:ra_app_m_vil/models/user.dart';
import 'package:ra_app_m_vil/providers/db_provider.dart';
import 'package:ra_app_m_vil/utils/validador.dart';

class RegistrarController {
  final BuildContext context;
  late final RegistrarBloc registrarBloc;
  late final UserBloc userBloc;

  final Map<String, String> formValues = {
    'fullName': '',
    'email': '',
    'password': '',
    'repeatPassword': '',
  };

  RegistrarController({
    required this.context,
  }) {
    userBloc = BlocProvider.of<UserBloc>(
      context,
      listen: false,
    );
    registrarBloc = BlocProvider.of<RegistrarBloc>(context, listen: false);
  }
  String? validarName(String? value) {
    if (!Validate(value ?? '').isName()) {
      registrarBloc.add(const ErrorRegistrarNameEvent('No se aceptan numeros'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarNameEmptyEvent(
          'El nombre no puede quedar vacio'));
    } else {
      registrarBloc.add(const ValidoRegistrarNameEvent());
    }
    return null;
  }

  String? validarEmail(String? value) {
    if (!Validate(value ?? '').isEmail()) {
      registrarBloc.add(const ErrorRegistrarEmailEvent('correo incorrecto'));
    } else {
      registrarBloc.add(const ValidoRegistrarEmailEvent());
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (!Validate(value ?? '').isPassword()) {
      registrarBloc.add(const ErrorRegistrarPasswordEvent('''
      La contraseña debe tenr al menos un digito,
      al menos una minuscula,
      al menos una mayuscula,
      al menos una carater no alfanumerico.
'''));
    } else if (value!.length < 8) {
      registrarBloc.add(const ErrorRegistrarPasswordShortEvent(
          'Debe detener al menos 8 caracter'));
    } else {
      registrarBloc.add(const ValidoRegistrarPasswordEvent());
    }
    return null;
  }

  /*String? validarRepeatPassword(String? password, String? repetirPassword) {
    if (password != repetirPassword) {
      registrarBloc.add(const ErrorRegistrarPasswordRepeatEvent(
          'La constraseña NO se parecen '));
    } else {
      registrarBloc.add(const ValidoRegistrarPasswordRepeatEvent());
    }
    return null;
  }*/

  String? validarRepeatPassword({password, repeatPassword}) {
    if ((registrarBloc.state.password == repeatPassword) ||
        (registrarBloc.state.repeatPassword == password)) {
      registrarBloc.add(const ValidoRegistrarPasswordRepeatEvent());
    } else {
      registrarBloc.add(const ErrorRegistrarPasswordRepeatEvent(
          'La contraseña no son iguales'));
    }
    return null;
  }

  bool botonActivo() {
    return registrarBloc.state.errorEmail == '' &&
        registrarBloc.state.errorFullName == '' &&
        registrarBloc.state.errorPassword == '' &&
        registrarBloc.state.errorRepetirPassword == '' &&
        registrarBloc.state.fullName != '' &&
        registrarBloc.state.email != '' &&
        registrarBloc.state.password != '';
  }

  void registrarUser() async {
    User user = User(
      fullName: registrarBloc.state.fullName,
      email: registrarBloc.state.email,
      password: registrarBloc.state.password,
    );

    User? temp = await DBProvider.db.getUser(user.email);
    if (temp == null) {
      await DBProvider.db.addUser(user);
      registrarBloc.add(const RegistrarMessageEvent(
        '',
      ));

      userBloc.add(UserEmailEvent(
        email: user.email,
      ));

      userBloc.add(UserFullNameEvent(
        fullName: user.fullName,
      ));
      if (context.mounted) {
        Navigator.popAndPushNamed(context, 'login');
      }
    } else {
      registrarBloc.add(const RegistrarMessageEvent('El correo ya existe'));
    }
  }

  void email(String? value) {
    registrarBloc.add(RegistrarEmailEvent(value ?? ''));
  }

  void fullName(String? value) {
    registrarBloc.add(RegistrarFullNameEvent(value ?? ''));
  }

  void password(String? value) {
    registrarBloc.add(RegistrarPassowordEvent(value ?? ''));
  }

  void repeatPassword(String? value) {
    registrarBloc.add(RegistrarRepeatPasswordEvent(value ?? ''));
  }
}
