import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:youapp/lib.dart';

class DioProvider {
  static DioProvider? _instance;

  final dio = Dio();

  DioProvider._internal() {
    dio.options.baseUrl = baseUrl;

    dio.options.headers = {
      "Accept": "*/*'",
      "Content-Type": "application/json",
    };

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  static DioProvider getInstance() {
    _instance ??= DioProvider._internal();
    return _instance!;
  }
}
