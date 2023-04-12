// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../cursos/curso_model.dart';

class AlunoModel {
  int? id;
  String? nome;
  List<CursoModel>? cursos;

  AlunoModel({
    this.id = 0,
    this.nome,
    this.cursos,
  });

  @override
  String toString() => 'AlunoModel(id: $id, nome: $nome, cursos: $cursos)';
}
