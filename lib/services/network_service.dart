import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzJkZjJlZDA0ZDUxZTVkMDNiYTEzYTciLCJpYXQiOjE3MzEwNjQ2MzAsImV4cCI6MTczMTA2ODIzMH0.3sjA9zB6kEp_8TCzPdrZ-zlYEnGkATvbehyS9720I64";
  static final Dio _dio = Dio();

  static Future<String?> post(String message) async {
    final response =
        await _dio.post("http://13.201.135.65:8000/voice?query=$message",
            data: _getRequestBody(message),
            options: Options(headers: {
              "Authorization": token,
              'Content-Type': 'application/json', // Optional: Set content type
            }));
    if (response.statusCode == 200) {
      var jsonData = response.data;
      return jsonEncode(jsonData);
    } else {
      return "Please try again";
    }
  }

  static Future<String?> get(String message) async {
    final response =
        await _dio.post("http://13.201.135.65:8000/voice?query=$message",
            data: _getRequestBody(message),
            options: Options(headers: {
              "Authorization": token,
              'Content-Type': 'application/json', // Optional: Set content type
            }));
    if (response.statusCode == 200) {
      var jsonData = response.data;
      return jsonEncode(jsonData);
    } else {
      return "Please try again";
    }
  }

  static Future<Response?> postResponse(String message) async {
    final response = await _dio.post("http://13.201.135.65:8000/command",
        data: _getRequestBody(message),
        options: Options(headers: {
          'Content-Type': 'application/json', // Optional: Set content type
        }));
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Map<String, dynamic> _getRequestBody(String message) {
    return {'command': message};
  }

  static Future<Response> getResponse({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
          contentType: 'application/json',
          headers: {
            "Authorization": token,
            "origin": "https://magnifi.com",
            "referer": "https://magnifi.com",
          },
          receiveDataWhenStatusError: true),
    );
  }
}
