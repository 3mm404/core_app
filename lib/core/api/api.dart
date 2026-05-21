import 'package:core_app/core/https/http_service.dart';
import 'package:core_app/core/kitton/kitton.dart';
import 'package:dio/dio.dart';

class Api {
  final HttpService http;

  Api(this.http);

  Map<String, dynamic> _unwrapBody(Response response) {
    final data = response.data;

    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return data['data'] as Map<String, dynamic>;
      }
      return data;
    }

    throw FormatException('Unexpected response body: ${data.runtimeType}');
  }

  Future<T> post<T extends Kitton>(
    String path, {
    Map<String, dynamic>? data,
    required T Function(Map<String, dynamic>) model,
  }) async {
    final response = await http.client.post(
      path,
      data: data,
    );

    final body = _unwrapBody(response);

    return model(body);
  }

  Future<void> postVoid(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    await http.client.post(
      path,
      data: data,
    );
  }

  Future<T> get<T extends Kitton>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) model,
  }) async {
    final response = await http.client.get(
      path,
      queryParameters: queryParameters,
    );

    final body = _unwrapBody(response);
    return model(body);
  }
}
