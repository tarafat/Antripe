import 'package:antripe/core/di/di.dart';
import 'package:antripe/core/network/dio/dio.dart';
import 'package:dio/dio.dart';

class HttpService {
  Future<Response> postHttp(String path, [dynamic data]) => locator<DioSingleton>().dio.post(path, data: data, cancelToken: DioSingleton.cancelToken);

  Future<Response> putHttp(String path, [dynamic data]) => locator<DioSingleton>().dio.put(path, data: data, cancelToken: DioSingleton.cancelToken);

  Future<Response> getHttp(String path, [dynamic data]) => locator<DioSingleton>().dio.get(data: data, path, cancelToken: DioSingleton.cancelToken);

  Future<Response> deleteHttp(String path, [dynamic data]) =>
      locator<DioSingleton>().dio.delete(path, data: data, cancelToken: DioSingleton.cancelToken);
}
