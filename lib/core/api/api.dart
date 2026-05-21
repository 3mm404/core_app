import 'package:core_app/core/https/http_service.dart';
import 'package:core_app/core/kitton/kitton.dart';

class Api {
  final HttpService http;

  Api(this.http);

  Future<T> post<T extends Kitton>(
    String path, {
    Map<String, dynamic>? data,
    required T Function(Map<String, dynamic>) model,
  }) async {
    final response = await http.client.post(
      path,
      data: data,
    );

    final body = response.data as Map<String, dynamic>;

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
}