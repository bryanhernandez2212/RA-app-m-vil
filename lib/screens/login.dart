import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_app_m_vil/blocs/login/login_bloc.dart';
import 'package:ra_app_m_vil/controllers/login_controller.dart';
import 'package:ra_app_m_vil/widgets/background.dart';
import 'package:ra_app_m_vil/widgets/textfield_custom.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  //const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    LoginController controller = LoginController(context: context);
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
      return Background(
        title: 'Inicio de sesion',
        widget: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.4,
                ),
                TexFieldCustom(
                    icon: Icons.email,
                    hintText: 'tunombre@gmail.com',
                    labelText: 'Correo electrónico',
                    errorText: state.errEmail,
                    fn: (value) {
                      controller.email(value ?? '');
                      return controller.validarEmail(value ?? '');
                    }),
                const SizedBox(
                  height: 20,
                ),
                TexFieldCustom(
                  icon: Icons.key,
                  labelText: 'Contraseña',
                  obscureText: true,
                  errorText: state.msgPassword,
                  fn: (value) {
                    controller.password(value ?? '');
                    return controller.validarPassword(value ?? '');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: !controller.botonActivo()
                          ? null
                          : () => controller.loginUser(),
                      child: const Text('Ingresar'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'registrar'),
                      child: const Text('Registrar'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: Text(state.errMsg),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
