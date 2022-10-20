import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:tracardi/api/endpoint.dart';
import 'package:tracardi/service/login/login_secure_storage_service.dart';

class Profile {
  static Future<int> countProfiles() async {
    var token = await LoginSecureStorage.getLoginToken();
    var url = Uri.parse(await Endpoint.countProfiles());
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
}
