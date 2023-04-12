// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

import 'package:vrsoft_flutter_inovar_test/entities/curso_entity.dart';

@Entity()
class Aluno {
  @Id()
  int id;
  String nome;

  final cursos = ToMany<Curso>();

  Aluno({
    this.id = 0,
    required this.nome,
  });

  @override
  String toString() => 'Aluno(id: $id, nome: $nome)';
}
