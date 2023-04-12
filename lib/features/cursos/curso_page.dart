import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:vrsoft_flutter_inovar_test/entities/aluno_entity.dart';
import 'package:vrsoft_flutter_inovar_test/entities/curso_entity.dart';
import 'package:vrsoft_flutter_inovar_test/features/alunos/aluno_model.dart';
import 'package:vrsoft_flutter_inovar_test/features/cursos/curso_model.dart';
import 'package:vrsoft_flutter_inovar_test/objectbox.g.dart';
import 'package:vrsoft_flutter_inovar_test/objectbox_store.dart';

class CursoPage extends StatelessWidget {
  const CursoPage({super.key});

  static final cursos = [
    'Desenvolvimento de Sistemas Multiplataforma',
    'Sistemas para Internet',
    'Gestão Empresarial',
  ];

  // final Curso curso;

  _getSiglas(String curso) {
    String siglas = '';
    return curso.split(' ').map((e) => e[0].toUpperCase()).toList().join();
  }

  @override
  Widget build(BuildContext context) {
    final box = Modular.get<Box>();
    // final cursoStore = box.get(2);
    final curso = box.get(2);

    return Scaffold(
      appBar: AppBar(
        title: Text(curso!.descricao,
            style: const TextStyle(overflow: TextOverflow.ellipsis)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Modular.to.navigate('/matricula', arguments: cursos);
              },
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            semanticContainer: true,
            child: ListTile(
              leading: CircleAvatar(
                  child: AutoSizeText(_getSiglas(curso.descricao))),
              title: Text(curso.descricao),
              subtitle: Text(curso.ementa),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: curso.alunos.length,
              itemBuilder: (context, index) {
                var aluno = curso.alunos[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${aluno.id}')),
                      title: Text(aluno.nome),
                      subtitle: Wrap(
                        spacing: 8,
                        children: aluno.cursos
                            .map((c) => Chip(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(25),
                                label: Text(
                                  _getSiglas(c.descricao),
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontSize),
                                )))
                            .toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: cursos.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: CircleAvatar(
              child: AutoSizeText(
                _getSiglas(cursos[index]),
              ),
            ),
            title: Text(cursos[index]),
            subtitle: Row(
              children: [
                Text('$index alunos'),
                const Spacer(),
                const Chip(
                  elevation: 1,
                  label: Text(
                    'não fechada',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
