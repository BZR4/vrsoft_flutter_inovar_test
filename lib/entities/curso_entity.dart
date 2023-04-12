import 'package:objectbox/objectbox.dart';
import 'package:vrsoft_flutter_inovar_test/entities/aluno_entity.dart';

@Entity()
class Curso {
  @Id()
  int id;
  String descricao;
  String ementa;

  // @Backlink()
  final alunos = ToMany<Aluno>();

  Curso({
    this.id = 0,
    required this.descricao,
    required this.ementa,
  });

  @override
  String toString() => 'Curso(id: $id, descricao: $descricao, ementa: $ementa)';
}
