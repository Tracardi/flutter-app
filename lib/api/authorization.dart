import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tracardi/api/endpoint.dart';

class AuthorizationModel {
  final String token;

  const AuthorizationModel({required this.token});

  factory AuthorizationModel.fromJson(Map<String, dynamic> json) {
    return AuthorizationModel(
      token: json['access_token'],
    );
  }
}

class Authorization {
  static Future<AuthorizationModel> login(String email, String password) async {
    var url = Uri.parse(await Endpoint.login());
    var response = await http.post(url, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
      'username': email,
      'password': password
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == HttpStatus.ok) {
      return AuthorizationModel.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == HttpStatus.badRequest) {
      throw Exception('Incorrect username or password.');
    }
    throw Exception('Internal error...');
  }

  static Future<bool> logout(String? token) async {
    if (token == null) {
      throw Exception('You are not logged');
    }

    var url = Uri.parse(await Endpoint.logout());

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      throw Exception('Internal error...');
    }
  }
}
