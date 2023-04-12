// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class ShopOrder {
  @Id()
  int id;
  int price;

  final customer = ToOne<Customer>();

  ShopOrder({
    this.id = 0,
    required this.price,
  });
}

@Entity()
class Customer {
  @Id()
  int id;
  String name;

  @Backlink()
  final orders = ToMany<ShopOrder>();

  Customer({
    this.id = 0,
    required this.name,
  });
}
