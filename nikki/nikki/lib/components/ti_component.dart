import 'package:flutter/material.dart';

class TiComponent extends StatelessWidget {
  final bool isPassword;
  final String label;
  final String hint;
  final String Function(String) validate;
  final void Function(String) change;

  TiComponent({
    this.isPassword = false,
    @required this.label,
    this.hint = "",
    @required this.validate,
    @required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder()
      ),
      validator: validate,
      onChanged: change,
    );
  }
}

