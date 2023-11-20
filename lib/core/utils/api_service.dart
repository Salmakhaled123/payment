import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required String url,
      required dynamic body,
      Map<String, String>? headers,
      required String token,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          headers: headers ?? {'Authorization': 'Bearer $token'},
          contentType: contentType,
        ));
    return response;
  }
}
