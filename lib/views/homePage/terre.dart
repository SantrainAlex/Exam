import 'package:flutter/material.dart';

import 'Progress.dart';

class terre extends StatelessWidget {
  var plans;
  terre({super.key, required this.plans}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [Text(plans.name)],),
        Container(
          color: const Color(0xFF766C42),
          height: 180,
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 130,
                width: 140,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5)
                ),
                child:Column(
                  children: [
                    Text(plans.coffee.name),
                    Text('-Goût : ${plans.coffee.gout.toString()}/100'),
                    Text('-Armertume : ${plans.coffee.armertume.toString()}/100'),
                    Text('-Teneur : ${plans.coffee.teneur.toString()}/100'),
                    Text('-Odorat : ${plans.coffee.odorat.toString()}/100'),
                  ],
                )
              ),
              Column(
               children:[
                 Progress(plan: plans)
               ]
                  )
            ],
          ),
        )
      ],
    );
  }
}
