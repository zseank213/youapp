import 'package:dio/dio.dart';
import 'package:youapp/lib.dart';

class LoginService {
  final dio = DioProvider.getInstance().dio;

  Future<Response> post({required LoginParamModel data}) async {
    var response = await dio.post(
      apiLogin,
      data: {
        'email': data.email,
        'username': data.username,
        'password': data.password,
      },
    );
    return response;
  }
}
