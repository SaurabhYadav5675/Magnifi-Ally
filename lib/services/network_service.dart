import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
  static String token =
      "eyJraWQiOiIxX1J6ZFJLX3FKYVNGQkZCRkFNRm9UeXNvM2JZLU02QnZuVHhZTk1HcG9VIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULkxDdkZqaGgzU0tlV2J0V09IQVpCYzVxREFQMHoycFQ4MWhjUkxFVzVfbVUub2FyMjNtNzdybU8zWEcza2w2OTciLCJpc3MiOiJodHRwczovL2F1dGgubWFnbmlmaS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNzMwODIzNTI5LCJleHAiOjE3MzA5MDk5MjksImNpZCI6IjBvYTFtMXlsMXR4ejhaeXluNjk3IiwidWlkIjoiMDB1MXNmb2EzdVRyUTE1T1I2OTciLCJzY3AiOlsicHJvZmlsZSIsImVtYWlsIiwib2ZmbGluZV9hY2Nlc3MiLCJvcGVuaWQiXSwiYXV0aF90aW1lIjoxNzMwNzg2MTI3LCJzdWIiOiJhZG1pbkBtYWduaWZpLmNvbSJ9.PvnriHYESn7i1RvdCZG6co1bWhRlQszEi5LLh81M25sJUw-zc2PLpAGzV2ZOrnjMY1rdlru3KuNsuICgovn791whLrsK9YhpjY2C7gGMOj-qF0C50OgXO2SyyIpdza2pQq7_ElvszjD212cIaI0mBFEdW9iTcZIzpMFBEtHdM_H1gxOD2gJBf1Tv7kiNnS0MAzaRITr_yRwb6VpwprHuXxonOdcF_qXfV_2kL7zPJMX98wgHYGSuevUID6COs6Z3ykB_Tj_-t7Wk5IRy0A5vZtVkYMUIYHDGmk4TXhK2FC7xnG3aoaRSkeLtX45Bs2Aok6qVmix8zcE2SE4r4-n3gA";
  static final Dio _dio = Dio();

  static Future<String?> post(String message) async {
    final response = await _dio.post("http://13.201.135.65:8000/command",
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
    return {'command': message};
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
