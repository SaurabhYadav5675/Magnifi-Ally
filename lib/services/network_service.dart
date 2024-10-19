import 'package:dio/dio.dart';

class NetworkService {
  static final Dio _dio = Dio();

  static Future<String?> post(String message) async {
    final response = await _dio.post("http://13.201.135.65:3000/ally",
        data: _getRequestBody(message),
        options: Options(headers: {
          'Content-Type': 'application/json', // Optional: Set content type
        }));
    print("Data11 get response ${response.statusCode} $response");
    return response.data.toString();
  }

  static Map<String, dynamic> _getRequestBody(String message) {
    return {'userId': "00u1sfoa3uTrQ15OR697", 'userMessage': message};
  }
}
