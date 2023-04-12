import 'package:flutter/material.dart';
import 'package:vrsoft_flutter_inovar_test/entities/curso_entity.dart';

class AlunoMatriculaPage extends StatelessWidget {
  const AlunoMatriculaPage({super.key, required this.cursos});

  final List<Curso> cursos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrícula'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          DropdownButton(
            items: cursos
                .map((c) => DropdownMenuItem(child: Text(c.descricao)))
                .toList(),
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
