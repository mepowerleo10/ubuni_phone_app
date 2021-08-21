library json_parser;

import 'dart:convert';

export 'package:ubuni_phone_app/api/json_models/phone.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}
