import 'dart:convert';

extension ResponseBodyToMap on String {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = jsonDecode(this);

    return result;
  }
}

extension ResponseBodyToList on String {
  List<Map<String, dynamic>> toJsonList() {
    final List<dynamic> result = jsonDecode(this);

    return result.cast<Map<String, dynamic>>();
  }
}
