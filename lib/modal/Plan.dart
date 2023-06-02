import 'dart:ffi';

import 'package:exam/modal/Coffee.dart';

class Plan{
  final String name;
  final String spe;
  final DateTime timer;
  final String sell ;
  final Coffee coffee;

  Plan({
    required this.name,
    this.spe = '',
    required this.timer,
    required this.sell,
    required this.coffee,
  });
}