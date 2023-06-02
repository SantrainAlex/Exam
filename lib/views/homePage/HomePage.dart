import 'package:exam/views/homePage/terre.dart';
import 'package:exam/modal/Coffee.dart';
import 'package:exam/provider/PlansModal.dart';
import 'package:exam/provider/CoffeeModal.dart';
import 'package:exam/provider/UserModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Plan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAddButton = true;
  late PlansModal planModalGlobal;
  UserModal currentUser = UserModal();
  
  Future<void> popup() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('sélectionner un café'),
          content: SizedBox(
            height: 300,
            width: 200,
            child: Column(
              children: [
                Consumer<CoffeeModal>(
                  builder: (context, coffeeModal, child) {
                    List<Coffee> coffees = coffeeModal.getCoffee;
                    List<Coffee> filteredCoffees = coffees.where((coffee) => coffee.price <= currentUser.users[0].DeeVee).toList();
                    return ListView(
                      shrinkWrap: true,
                      children: filteredCoffees.map((coffee) => RadioListTile(
                        title: Text('${coffee.name} coûte ${coffee.price} D', style: const TextStyle(fontSize: 12),),
                        value: coffee.name,
                        groupValue: filteredCoffees,
                        onChanged: (value) {
                            Plan newPlan = Plan(name: 'Plan ${planModalGlobal.getPlans.length + 1}', sell: 'true', coffee: coffee, timer: DateTime.now());
                            planModalGlobal.addPlan(newPlan);
                            currentUser.subtractDeeVee(coffee.price);
                            setState(() {});
                            Navigator.pop(context);
                        },
                      )).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions:  [
          Text('${currentUser.users[0].DeeVee} D', style: const TextStyle(fontSize: 20),)
        ],
        backgroundColor: const Color(0xFFD8D8C1),
      ),
      body: Consumer<PlansModal>(
        builder: (context, planModal, child) {
          planModalGlobal = planModal;
          List<Plan> plans = planModal.getPlans;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: (plans.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    final int firstIndex = index * 2;
                    final int secondIndex = firstIndex + 1;
                    final bool hasSecondElement = secondIndex < plans.length;
                    return Row(
                      children: [
                        // Premier élément de la ligne
                        Expanded(
                          child: terre(plans: plans[firstIndex],),
                        ),

                        // Deuxième élément de la ligne s'il est disponible
                        if (hasSecondElement)
                          Expanded(
                            child: terre(plans: plans[secondIndex]),
                          ),
                      ],
                    );
                  },
                ),
              ),
              if (showAddButton && planModal.getPlans.length < 4)
                FloatingActionButton(
                  onPressed: popup,
                  child: const Icon(Icons.add),
                ),
            ],
          );
        },
      ),
    );
  }
}
