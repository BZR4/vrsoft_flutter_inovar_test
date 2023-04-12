// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String? name;

  @Property(type: PropertyType.date)
  DateTime? date;

  @Transient()
  int? computedproperty;

  User({this.name, this.date});
}
