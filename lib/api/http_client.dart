import 'package:dio/dio.dart';
import 'package:ubuni_phone_app/api/json_parsers/json_parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({required this.endpoint, this.data = const {}});

  static final _client = Dio(BaseOptions(
      baseUrl: "https://www.paa.ubuni.co.tz",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      }));

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final _response = await _client.get<String>(endpoint);
    print('${_response.realUri}');
    return parser.parseFromJson(_response.data ?? "");
  }
}
