import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
  static String token =
      "eyJraWQiOiIxX1J6ZFJLX3FKYVNGQkZCRkFNRm9UeXNvM2JZLU02QnZuVHhZTk1HcG9VIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnJOZEJkaFN1Wm81UC0yMlJSRkU1QlI3Ym9mUlYyenVXYzhlZzhMcVBNTDAub2FyMjFpbG44ckFkdzZIZzQ2OTciLCJpc3MiOiJodHRwczovL2F1dGgubWFnbmlmaS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNzMwNjU3MTk0LCJleHAiOjE3MzA3NDM1OTQsImNpZCI6IjBvYTFtMXlsMXR4ejhaeXluNjk3IiwidWlkIjoiMDB1MXNmb2EzdVRyUTE1T1I2OTciLCJzY3AiOlsib2ZmbGluZV9hY2Nlc3MiLCJwcm9maWxlIiwib3BlbmlkIiwiZW1haWwiXSwiYXV0aF90aW1lIjoxNzI5MTcyNjEzLCJzdWIiOiJhZG1pbkBtYWduaWZpLmNvbSJ9.0CEwhhbhqUGD79wlAlp30s-WWLoX15AsIFUtZabygonxtSKFgugMZbPdHL5hiLr7wXk9rZrLts5eqzYndhGZ9WghoQiKLyyviVVvtnVD4dCh1O9e2dwpjyanELvADkrqKmsk6T6Q54scw_h2RhtASDoJTO4fZU-JE0E8_GB105a7l2GVIdf7F-BAlzkoUHGlXWq-bekVVx2BlmUFMLfQomBM3OE4QXNgnCnvzIGbyDGG8msF5lBuFpczmn3V4W0d6gIvfrYzGGoqBRAxH-te9_9k7Dx7yGP9CAZpCia0VjMb3zyx4N8oH36jRNh4woVy_xwkYvB7l5gYenwYtDVFxQ";
  static final Dio _dio = Dio();

  static Future<String?> post(String message) async {
    final response = await _dio.post("http://13.201.135.65:3000/ally",
        data: _getRequestBody(message),
        options: Options(headers: {
          'Content-Type': 'application/json', // Optional: Set content type
        }));
    if (response.statusCode == 200) {
      var jsonData = response.data;
      return jsonEncode(jsonData);
    } else {
      return "Please try again";
    }
  }

  static Map<String, dynamic> _getRequestBody(String message) {
    return {'userId': "00u1sfoa3uTrQ15OR697", 'userMessage': message};
  }

  static Future<Response> get({
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
