import 'dart:async';
import "package:http/http.dart" show Client;


class Network {
  Client client = Client();

  static const String APPLICATION_JSON = 'application/json';
  static const String CONTENT_TYPE = 'application/x-www-form-urlencoded';

  Future<dynamic> getRequest(String url, {bool withToken = true}) async {
    try {
      final response = await client
          .get(
            Uri.parse("$url"),
            headers: {
              'content-type': CONTENT_TYPE,
              'accept': APPLICATION_JSON,
              // HttpHeaders.authorizationHeader: 'Bearer $accessToken'
            },
          )
          .timeout(Duration(seconds: 20));

      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }

  Future<dynamic> putRequest(String url, dynamic body) async {
    
    final response = await client
        .put(
          Uri.parse("$url"),
          headers: {
            'content-type': CONTENT_TYPE,
            'accept': APPLICATION_JSON,
            // HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          },
          body: body,
        );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> patchRequest(String url, dynamic body) async {
    
    final response = await client
        .patch(
          Uri.parse("$url"),
          headers: {
            'content-type': CONTENT_TYPE,
            'accept': APPLICATION_JSON,
            // HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          },
          body: body,
        );

    if (response.statusCode == 401) {
      throw Exception('${response.statusCode}');
    }

    return response;
  }

  Future<dynamic> postRequest(String url, Map<String, String> body) async {
    
    try {
      final response = await client
          .post(
            Uri.parse("$url"),
            headers: {
              'Content-Type': CONTENT_TYPE,
              'Accept': APPLICATION_JSON,
            },
            body: body,
          );
      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }

  Future<dynamic> delRequest(String url) async {
    
    try {
      final response = await client
          .delete(
            Uri.parse("$url"),
            headers: {
              'Content-Type': CONTENT_TYPE,
              'Accept': APPLICATION_JSON,
            },
            
          );
      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }
}
