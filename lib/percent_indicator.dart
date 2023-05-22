import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatefulWidget {
  const PercentIndicator({Key? key}) : super(key: key);

  @override
  State<PercentIndicator> createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linear Percent Indicators"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 150.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: const Text("50.0%",style: TextStyle(fontSize: 12.0)),
                trailing: const Icon(Icons.mood_outlined),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: const Text("left content"),
                trailing: const Text("right content"),
                percent: 0.2,
                center: const Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 1000,
                percent: 0.9,
                center: const Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: const Text("50.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20,),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              percent: 0.5,
              header: const Text("Icon header"),
              center: const Icon(Icons.person_pin,size: 50.0,color: Colors.blue),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            const SizedBox(height: 20,),
            CircularPercentIndicator(
              radius: 50.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.4,
              center: const Text("40 hours",style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.yellow,
              progressColor: Colors.red,
            ),
            const SizedBox(height: 20,),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: const Text("70.0%",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              footer: const Text("Sales this week",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 10.0,
                percent: 1.0,
                center: const Text("100%"),
                progressColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10,
                  center: const Text("10%"),
                  progressColor: Colors.red,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30,
                  center: const Text("30%"),
                  progressColor: Colors.orange,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.60,
                  center: const Text("60%"),
                  progressColor: Colors.yellow,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.90,
                  center: const Text("90%"),
                  progressColor: Colors.green,
                )
              ],
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
