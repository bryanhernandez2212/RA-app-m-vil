import 'package:flutter/material.dart';

class LoginHeder extends StatelessWidget {
  final String title;
  const LoginHeder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 164, 65),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
      child: SafeArea(
          child: Center(
              child: Text(
        title,
        style: const TextStyle(fontSize: 50, color: Colors.white),
      ))),
    );
  }
}
