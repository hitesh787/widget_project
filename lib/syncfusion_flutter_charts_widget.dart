import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class SyncfusionFlutterChartsWidget extends StatefulWidget {
  const SyncfusionFlutterChartsWidget({Key? key}) : super(key: key);

  @override
  State<SyncfusionFlutterChartsWidget> createState() => _SyncfusionFlutterChartsWidgetState();
}

class _SyncfusionFlutterChartsWidgetState extends State<SyncfusionFlutterChartsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
              padding: const EdgeInsets.all(50),
              margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: SfSparkLineChart(
                  //Enable the trackball
                  trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  //Enable marker
                  marker: const SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  //Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  data: const <double>[
                    10, 25, -30, 0, 1, -21, 37, -57, -44, -52, 13, -26, 47, 55, 52, 50, 30
                  ],
                )
            )
        )
    );
  }
}
