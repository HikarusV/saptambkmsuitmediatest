import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmediatest/data/models/user.dart';

class Unsplash {
  static String baseUrl = 'https://api.unsplash.com/photos';
  static String accessKey =
      'client_id=WBzeS0YdJkNMoIPYfl2e2Mr8dpV8mBaNwtcYXLB5B0o';

  static Future<Map<String, dynamic>> getUser({int page = 1}) async {
    final Uri url = Uri.parse('$baseUrl?$accessKey&page=$page');

    bool error = false;
    List? jsonResponse;
    List<Users> data = [];

    try {
      final response = await http.get(url);
      jsonResponse = jsonDecode(response.body);
    } on Exception {
      error = true;
    }
    for (int i = 0; i < jsonResponse!.length; i++) {
      data.add(Users.fromMap(jsonResponse[i]));
    }

    return {
      "error": error,
      "data": data,
      "message":
          (error ? "Harap pastikan terhubung dengan internet" : "Success")
    };
  }

  static Future<bool> getHitDownloadUrl(String downloadLocation) async {
    final Uri url = Uri.parse('$downloadLocation&$accessKey');

    bool success = false;

    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        success = true;
      }
    } finally {}

    return success;
  }
}
