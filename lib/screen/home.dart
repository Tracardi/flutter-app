import 'package:flutter/material.dart';
import 'package:tracardi/screen/reports/line_chart.dart';
import 'package:tracardi/screen/reports/report_date_toggle_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeedf2),
      body: PageView(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  // Text('test'),
                  // DateToggleButtons(),
                  // LineChartEvent()
                  LineChartWidget(
                    nameChart: "Events",
                  ),
                  LineChartWidget(
                    nameChart: "Instances",
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
