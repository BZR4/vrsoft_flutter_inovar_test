import 'package:flutter/material.dart';
import 'package:vrsoft_flutter_inovar_test/features/alunos/aluno_model.dart';

class CardAluno extends StatelessWidget {
  const CardAluno({super.key, required this.aluno});

  final AlunoModel aluno;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(child: Text('${aluno.id}')),
        title: Text('${aluno.nome}'),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Wrap(
            runAlignment: WrapAlignment.end,
            spacing: 8,
            children: aluno.cursos!
                .map(
                  (e) => Chip(
                    elevation: 0,
                    label: Text(
                      _getSiglas(e.descricao),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  _getSiglas(String curso) {
    String siglas = '';
    return curso.split(' ').map((e) => e[0].toUpperCase()).toList().join();
  }
}
