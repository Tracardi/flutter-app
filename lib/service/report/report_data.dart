class ReportsData {
  final List<dynamic> reports;

  ReportsData({required this.reports});

  // factory JsonData.fromJson(Map<String, dynamic> parsedJson) {
  //   return JsonData(reports: parsedJson['result']);
  // }
  factory ReportsData.fromJson(Map<String, dynamic> parsedJson) => ReportsData(
      reports: List<Report>.from(
          parsedJson["result"].map((x) => Report.fromJson(x))));
}

class Report {
  final String date;
  //final String interval;
  final int count;

  Report(this.date, this.count);

  factory Report.fromJson(Map<String, dynamic> parsedJson) {
    return Report(parsedJson['date'], parsedJson['count']);
  }
}

  // factory ReportData.fromJson(Map<DateTime, int> json) {
  //   return ReportData(json['date'] as DateTime, json['count'] as int);
  // }


// class ReportData {
//   Map<DateTime, int> data;

//   ReportData(this.data);
// }
