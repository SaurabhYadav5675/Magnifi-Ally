import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
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
}
