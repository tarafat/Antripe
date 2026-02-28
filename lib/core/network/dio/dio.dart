import 'package:antripe/core/network/dio/log.dart';
import 'package:dio/dio.dart';

import '../endpoints.dart';

final class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();
  static CancelToken cancelToken = CancelToken();
  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  late Dio dio;

  Iterable<Interceptor> interceptor = [Logger()];
  void create() {
    BaseOptions options = BaseOptions(
      baseUrl: NetworkConstants.kBASEURL,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
      responseType: ResponseType.json,
      headers: {NetworkConstants.kACCEPT: NetworkConstants.kACCEPTTYPE},
    );
    dio = Dio(options)..interceptors.addAll(interceptor);
  }

  void cancelAllRequests() {
    cancelToken.cancel("Cancelled by user");
    cancelToken = CancelToken();
  }
}
