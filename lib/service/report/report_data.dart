class ReportsData {
  final int total;
  final List<Report> result;

  ReportsData({required this.total, required this.result});

  factory ReportsData.fromJson(Map<String, dynamic> parsedJson) {
    final total = parsedJson['total'] as int;
    final reportsData = parsedJson['result'] as List<dynamic>?;
    final reports = reportsData != null
        ? reportsData.map((reportData) => Report.fromJson(reportData)).toList()
        : <Report>[];

    return ReportsData(total: total, result: reports);
  }
}

class Report {
  final String date;
  final double? count;

  Report({required this.date, this.count});

  factory Report.fromJson(Map<String, dynamic> parsedJson) {
    final date = parsedJson['date'] as String;
    final count = parsedJson['count'] as double?;

    return Report(date: date, count: count);
  }
}
