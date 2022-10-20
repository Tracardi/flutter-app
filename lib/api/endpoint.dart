import 'package:tracardi/service/login/login_secure_storage_service.dart';

class Endpoint {
  static Future<String?> _serverURL() async {
    var server = await LoginSecureStorage.getLoginServer() ?? 'localhost:8686';
    return "http://$server";
  }

  static Future<String> login() async {
    return "${await _serverURL()}/user/token";
  }

  static Future<String> logout() async {
    return "${await _serverURL()}/user/logout";
  }

  static Future<String> countInstances() async {
    return "${await _serverURL()}/instances/count";
  }

  static Future<String> avgProcessTime() async {
    return "${await _serverURL()}/event/avg/process-time";
  }

  static Future<String> countEvents() async {
    return "${await _serverURL()}/event/count";
  }

  static Future<String> countProfiles() async {
    return "${await _serverURL()}/profile/count";
  }

  static Future<String> countSessions() async {
    return "${await _serverURL()}/session/count";
  }

  static Future<String> eventsByType() async {
    return "${await _serverURL()}/events/by_type";
  }

  static Future<String> eventsByTag() async {
    return "${await _serverURL()}/events/by_tag";
  }

  static Future<String> eventsBySource() async {
    return "${await _serverURL()}/events/by_source";
  }

  static Future<String> eventsByStatus() async {
    return "${await _serverURL()}/events/by_status";
  }
}
