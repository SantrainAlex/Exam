import 'package:uuid/uuid.dart';

class Coffee{
  final String name;
  final int gout;
  final int armertume;
  final int teneur ;
  final int odorat;
  final Duration growTime;
  final int price;
  final double product;

  Coffee({
    required this.name,
    required this.gout,
    required this.armertume,
    required this.teneur,
    required this.odorat,
    required this.growTime,
    required this.price,
    required this.product
  });
}