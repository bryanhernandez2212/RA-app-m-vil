import 'package:flutter/material.dart';

class TexFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String? values)? fn;

  const TexFieldCustom({
    super.key,
    this.icon,
    this.hintText,
    this.labelText,
    this.errorText,
    this.obscureText = false,
    this.fn,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
        errorText: errorText == '' ? null : errorText,
      ),
      obscureText: obscureText,
      onChanged: fn,
    );
  }
}
