import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  static Dio createDio() {
    final dio = Dio();
    dio.options.headers["Authorization"] =
        'O6YyFIDny2VWPHpdVEcsXKCnxSCQ0dUFNPGNFLZbou0cvy0o1U3LmcPC';

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    return dio;
  }
}
