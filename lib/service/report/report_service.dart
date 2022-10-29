import 'package:fl_chart/fl_chart.dart';
import 'package:tracardi/service/report/report_data.dart';
import 'package:intl/intl.dart';

class ReportService {
  List<FlSpot>? getChartData(ReportsData data) {
    List<FlSpot> spotList = <FlSpot>[];
    //var data = await Event.getEventHistogram();

    for (var element in data.result) {
      var wtf = FlSpot(
          DateFormat("yy-MM-dd")
              .parse(element.date)
              .millisecondsSinceEpoch
              .toDouble(),
          element.count!);
      spotList.add(wtf);
    }
    return spotList;
  }
}
