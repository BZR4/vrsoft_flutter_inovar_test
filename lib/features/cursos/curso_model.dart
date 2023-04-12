// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vrsoft_flutter_inovar_test/features/alunos/aluno_model.dart';

class CursoModel {
  int id;
  String descricao;
  String ementa;
  List<AlunoModel> alunos;

  CursoModel(
      {this.id = 0,
      required this.descricao,
      required this.ementa,
      required this.alunos});

  @override
  String toString() {
    return 'CursoModel(id: $id, descricao: $descricao, ementa: $ementa, alunos: $alunos)';
  }
}
