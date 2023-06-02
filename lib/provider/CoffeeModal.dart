import 'dart:collection';

import 'package:exam/modal/Coffee.dart';
import 'package:flutter/cupertino.dart';

class CoffeeModal extends ChangeNotifier {

  List<Coffee> _Coffee = [
    Coffee(name: 'Le kafé Rubisca', gout: 15, armertume: 54, teneur: 35, odorat: 19, growTime: Duration(minutes: 10), price: 2, product: 0.632),
    Coffee( name: 'Le kafé Arbrista', gout: 87, armertume: 4, teneur: 35, odorat: 59, growTime: Duration(minutes: 40), price: 6, product: 0.275),
    Coffee(name: 'Le kafé Roupetta', gout: 35, armertume: 41, teneur: 75, odorat: 67, growTime: Duration(minutes: 20), price: 3, product: 0.461),
    Coffee(name: 'Le kafé Tourista', gout: 3, armertume: 91, teneur: 74, odorat: 6, growTime: Duration(minutes: 1), price: 1, product: 0.961),
    Coffee(name: 'Le kafé Goldoria', gout: 39, armertume: 9, teneur: 7, odorat: 87, growTime: Duration(minutes: 30), price: 2, product: 0.473),
  ];
  late String selectedCoffeeId = "0";
  // ID du café sélectionné

  UnmodifiableListView<Coffee> get getCoffee => UnmodifiableListView(_Coffee);



}