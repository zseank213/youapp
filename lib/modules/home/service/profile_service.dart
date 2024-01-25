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

  Future<Response> updateProfile({required ProfileParamModel param}) async {
    Map<String, dynamic> headers = {
      "x-access-token": "${await SecureStorage.getAccessToken()}",
    };

    var response = await dio.put(
      apiUpdateProfile,
      data: {
        'name': param.name,
        'birthday': param.birthday,
        'height': param.height,
        'weight': param.weight,
        'interests': param.interest,
      },
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> createProfile({required ProfileParamModel param}) async {
    Map<String, dynamic> headers = {
      "x-access-token": "${await SecureStorage.getAccessToken()}",
    };

    var response = await dio.post(
      apiCreateProfile,
      data: {
        'name': param.name,
        'birthday': param.birthday,
        'height': param.height,
        'weight': param.weight,
        'interests': param.interest,
      },
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
