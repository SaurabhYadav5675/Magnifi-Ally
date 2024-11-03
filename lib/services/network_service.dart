import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
  static String token =
      "eyJraWQiOiIxX1J6ZFJLX3FKYVNGQkZCRkFNRm9UeXNvM2JZLU02QnZuVHhZTk1HcG9VIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULkctZEhYdmxXbjVNUzZJU3pEazRwUlZfYTA2YjJvR3B1dFRlSEtfNEdBWWcub2FyMjFpbG44ckFkdzZIZzQ2OTciLCJpc3MiOiJodHRwczovL2F1dGgubWFnbmlmaS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNzMwNTYxNjI5LCJleHAiOjE3MzA2NDgwMjksImNpZCI6IjBvYTFtMXlsMXR4ejhaeXluNjk3IiwidWlkIjoiMDB1MXNmb2EzdVRyUTE1T1I2OTciLCJzY3AiOlsib2ZmbGluZV9hY2Nlc3MiLCJvcGVuaWQiLCJlbWFpbCIsInByb2ZpbGUiXSwiYXV0aF90aW1lIjoxNzI5MTcyNjEzLCJzdWIiOiJhZG1pbkBtYWduaWZpLmNvbSJ9.j7Fulr17BXeEdzbV84_G-b-0XQWlLah2WkBJ_RIhO5YS5J-wEHJZY-Q37iExp-wbFbYt-rY712usOQGtaqrCaGYZ8M1JIsrAFOo5FCZ_wiAZ5r2b10OuLkfqQuMIx63qOf1WsHopbR-uJkEBbSVDjfJjg-3mmYfoHPCLMRM_SxDXBOPEdEy_I0KxqlmzK_PLPLlUNl1E4kMs1U21gBx5e06mcB1W6gsdK3-qZFLjWcD0FVxQV9rRyyKERmHmoXcZSO0cdUIJ5fF1GqRtSU0wRaQHKIiaBniZVGjUBvQc4_KPycEci3w8nT0naZnYFMgywigD2x_c6CPdiPoJuWiDzg";
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
