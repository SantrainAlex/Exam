import 'package:exam/modal/Plan.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  final  Plan plan;
  const Progress({Key? key, required this.plan}) : super(key: key);

  @override
  State<Progress> createState() =>
      _ProgressState();
}

class _ProgressState extends State<Progress>
    with TickerProviderStateMixin {
  late AnimationController controller;
  int nbrTimer = 0;

  @override
  void initState() {
    var planTime = widget.plan.timer;
    planTime =  planTime.add(widget.plan.coffee.growTime) ;
    var currentTime = DateTime.now();
    var diffTime = planTime.difference(currentTime);
    controller = AnimationController(

      vsync: this,
      duration: diffTime,
    )..addListener(() {
      setState(() {});
      if(controller.value > 0.9999){
        nbrTimer++;
      }

    });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 170,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
