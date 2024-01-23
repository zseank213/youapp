import 'package:dio/dio.dart';
import 'package:youapp/lib.dart';

class ProfileService {
  final dio = DioProvider.getInstance().dio;

  Future<Response> getProfile() async {
    Map<String, dynamic> headers = {
      "x-access-token": "${await SecureStorage.getAccessToken()}",
    };

    var response = await dio.get(
      apiGetProfile,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
