import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sample_ui_project/configs/config_environment.dart';

class DioProvider {
  static DioCacheManager? _manager;
  static DioCacheManager? _managerPost;

  static DioCacheManager getCacheManager() {
    _manager ??= DioCacheManager(CacheConfig(
      baseUrl: ConfigEnvironment.baseUrl,
    ));
    return _manager!;
  }

  static DioCacheManager getCacheManagerPost() {
    _managerPost ??= DioCacheManager(CacheConfig(
      baseUrl: ConfigEnvironment.baseUrl,
    ));
    return _managerPost!;
  }

  static Dio instance() {
    final dio = Dio()
      ..options.baseUrl = ConfigEnvironment.baseUrl
      ..options.connectTimeout = 300000
      ..options.receiveTimeout = 300000
      ..interceptors.add(HttpLogInterceptor())
      ..interceptors.add(DioCacheManager(
        CacheConfig(
          baseUrl: ConfigEnvironment.baseUrl,
        ),
      ).interceptor);

    return dio;
  }

  static Dio instancePost({required String baseUrl}) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 300000
      ..options.receiveTimeout = 300000
      ..interceptors.add(HttpLogInterceptor())
      ..interceptors.add(DioCacheManager(
        CacheConfig(
          baseUrl: baseUrl,
        ),
      ).interceptor);

    return dio;
  }
}

class HttpLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST: ${options.uri}\n'
        'data=${options.data}\n'
        'method=${options.method}\n'
        'headers=${options.headers}\n'
        'queryParameters=${options.queryParameters}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE: ${response.realUri}\n Body: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR ${err.response?.statusCode}\n Error: ${err.response}');
    return super.onError(err, handler);
  }

  // @override
  // Future onResponse(Response response, ResponseInterceptorHandler handler) {
  //   log('onRequest: ${response.realUri}');
  //   // log('Header = ${response.request.headers}');
  //   // log('data = ${response.request.data}');
  //   log('onResponse: $response');
  //   // return super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   log('onError: $err\n'
  //       'Response: ${err.response}');
  // }
}
