import 'package:flutter/material.dart';

class InputTexto extends StatelessWidget {
  const InputTexto({
    super.key,
    required this.campo,
    required this.icon,
    this.limite = 50,
  });

  final String campo;
  final IconData icon;
  final int? limite;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        labelText: campo,
        prefixIcon: Icon(icon),
        helperText: 'Help Text',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$campo é requerido';
        } else if (value.length > limite!) {
          return '$campo excede o tamanho máximo de $limite caracteres.';
        } else {
          return null;
        }
      },
    );
  }
}
