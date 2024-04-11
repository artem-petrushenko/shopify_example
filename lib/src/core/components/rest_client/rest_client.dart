import 'package:dio/dio.dart';
import 'package:shopify_example/src/core/components/rest_client/rest_client_endpoint.dart';

class RestClient {
  RestClient() {
    _dio = Dio(_options())..interceptors.addAll([wrapper()]);
  }

  late final Dio _dio;

  Dio get dio => _dio;

  BaseOptions _options() => BaseOptions(
        baseUrl: RestClientEndpoint.baseUrl,
        headers: {
          'X-Shopify-Access-Token': RestClientEndpoint.accessToken,
        },
        connectTimeout: const Duration(seconds: 16),
        receiveTimeout: const Duration(seconds: 16),
        sendTimeout: const Duration(seconds: 16),
      );

  QueuedInterceptorsWrapper wrapper() => QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (error, handler) async {
          return handler.next(error);
        },
      );
}
