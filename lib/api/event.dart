import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:tracardi/api/endpoint.dart';
import 'package:tracardi/service/login/login_secure_storage_service.dart';
import 'package:tracardi/service/report/report_data.dart';

class Event {
  static Future<int> countEvents() async {
    var token = await LoginSecureStorage.getLoginToken();
    var url = Uri.parse(await Endpoint.countEvents());
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    var json = jsonDecode(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return json['count'];
    }
    return 0;
  }

  static Future<ReportsData> getEventHistogram() async {
    var token = await LoginSecureStorage.getLoginToken();
    var url = Uri.parse(await Endpoint.eventsHistogram());
    Map bodyData = {
      "minDate": {
        "absolute": null,
        "delta": {"type": "minus", "value": -1, "entity": "month"},
        "now": null
      },
      "maxDate": {"absolute": null, "delta": null},
      "where": "",
      "limit": 31
    };
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(bodyData));

    final parsedJson = json.decode(response.body);

    ReportsData result = ReportsData.fromJson(parsedJson);

    return result;
  }
}
