import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_app_m_vil/blocs/registrar/registrar_bloc.dart';
import 'package:ra_app_m_vil/controllers/registra_controller.dart';
import 'package:ra_app_m_vil/widgets/background.dart';
import 'package:ra_app_m_vil/widgets/textfield_custom.dart';

class Registrar extends StatelessWidget {
  const Registrar({super.key});

  @override
  Widget build(BuildContext context) {
    const double separacion = 15;
    double height = MediaQuery.of(context).size.height;
    //RegistrarBloc bloc = BlocProvider.of<RegistrarBloc>(context, listen: false);
    RegistrarController controller = RegistrarController(context: context);
    /*final Map<String, String> formValues = {
      'fullName': '',
      'email': '',
      'password': '',
      'repetirPassword': '',
    };  */

    return Scaffold(
        body: BlocBuilder<RegistrarBloc, RegistrarState>(builder: (_, state) {
      return Background(
        title: 'Registro',
        widget: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: separacion),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.3,
                  ),
                  TexFieldCustom(
                      icon: Icons.person,
                      labelText: 'Nombre',
                      hintText: 'juan Lopez Perez',
                      errorText: state.errorFullName,
                      fn: (value) {
                        controller.fullName(value);
                        return controller.validarName(value);
                      }),
                  const SizedBox(
                    height: separacion,
                  ),
                  TexFieldCustom(
                      icon: Icons.email,
                      labelText: 'Correo electronico',
                      hintText: 'tunombre@gmail.com',
                      errorText: state.errorEmail,
                      fn: (value) {
                        controller.email(value);
                        return controller.validarEmail(value);
                      }),
                  const SizedBox(
                    height: separacion,
                  ),
                  TexFieldCustom(
                      icon: Icons.key,
                      labelText: 'Contraseña',
                      obscureText: true,
                      errorText: state.errorPassword,
                      fn: (value) {
                        controller.password(value);
                        controller.validarPassword(value);
                        return controller.validarRepeatPassword(
                            password: value);
                      }),
                  const SizedBox(
                    height: separacion,
                  ),
                  TexFieldCustom(
                      icon: Icons.key,
                      labelText: 'Repetir Contraseña',
                      obscureText: true,
                      errorText: state.errorRepetirPassword,
                      fn: (value) {
                        controller.repeatPassword(value);
                        return controller.validarRepeatPassword(
                            repeatPassword: value);
                      }),
                  const SizedBox(
                    height: separacion,
                  ),
                  ElevatedButton(
                      onPressed: !controller.botonActivo()
                          ? null
                          : () => controller.registrarUser(),
                      child: const Text('Registrar')),
                  SizedBox(
                    height: 100,
                    child: Text(state.message),
                  ),
                ]))),
      );
    }));
  }
}
