import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrsoft_flutter_inovar_test/entities/curso_entity.dart';
import 'package:vrsoft_flutter_inovar_test/features/cursos/curso_model.dart';

class CursosPage extends StatelessWidget {
  const CursosPage({super.key, required this.cursos});

  // static final cursos = [
  //   'Desenvolvimento de Sistemas Multiplataforma',
  //   'Sistemas para Internet',
  //   'Gestão Empresarial',
  //   'Redes de Computadores',
  // ];

  final List<Curso> cursos;

  _getSiglas(String curso) {
    return curso
        .replaceAll(' de ', ' ')
        .replaceAll(' da ', ' ')
        .replaceAll(' para ', ' ')
        .split(' ')
        .map((e) => e[0].toUpperCase())
        .toList()
        .join();
  }

  @override
  Widget build(BuildContext context) {
    // print(_getSiglas(cursos[0]));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: ListView.builder(
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Modular.to.navigate('/curso', arguments: cursos[index]);
            },
            child: Card(
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: CircleAvatar(
                  child: AutoSizeText(
                    _getSiglas(cursos[index].descricao),
                  ),
                ),
                title: Text(cursos[index].descricao),
                subtitle: Row(
                  children: [
                    Text('${cursos[index].alunos.length} alunos'),
                    Spacer(),
                    Chip(
                      elevation: 1,
                      label: Text(
                        cursos[index].alunos.length <= 1
                            ? 'turma não fechada'
                            : 'turma cheia',
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          // icon: const Icon(Icons.plus_one),
          onPressed: () {},
          label: const Text('CRIAR')),
    );
  }
}
