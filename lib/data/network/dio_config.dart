import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// I am aware of the meme about pushing the key and having the last working day.
// In a real project, I would not have done this. However, in this project, I deliberately
// allowed it so that if there are any issues with my key, you will be able to insert your own
// without any problems.

class DioConfig {
  static Dio createDio() {
    final dio = Dio();
    dio.options.headers["Authorization"] =
        'O6YyFIDny2VWPHpdVEcsXKCnxSCQ0dUFNPGNFLZbou0cvy0o1U3LmcPC'; // API KEY

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
