import 'dart:collection';
import 'package:exam/modal/Coffee.dart';
import 'package:exam/provider/CoffeeModal.dart';
import 'package:flutter/cupertino.dart';
import '../modal/Plan.dart';

class PlansModal extends ChangeNotifier {
  final List<Plan> _Plans = [
  ];

  UnmodifiableListView<Plan> get getPlans => UnmodifiableListView(_Plans);

  void addPlan(Plan item) {
    _Plans.add(item);
    notifyListeners();
  }
}
