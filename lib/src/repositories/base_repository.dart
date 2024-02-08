import 'dart:io';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;

abstract base class Repository {
  Repository({
    http.Client? client,
    String baseURL = "",
  })  : _client = client ?? http.Client(),
        _baseURL = baseURL,
        assert(baseURL.isNotEmpty, "baseURL of a Repository cannot be empty");

  final http.Client _client;
  final String _baseURL;

  String get baseURL => _baseURL;

  Future<String?> get(Uri uri, [Map<String, String>? headers]) async {
    final res = await _client.get(uri, headers: headers);

    if (res.statusCode == HttpStatus.ok) {
      return res.body;
    } else {
      // Handle 4XX & 5XX statusCode errors gracefully
      // This is fine for now
      dev.log(
        'GET request failed: ${res.reasonPhrase}',
        name: 'HTTP Request Failure',
        time: DateTime.now(),
        error: res.request,
      );

      return null;
    }
  }
}
