import 'package:ubuni_phone_app/api/json_parsers/json_parser.dart';

class PhoneParser extends JsonParser<List<Phone>>
    with ListDecoder<List<Phone>> {
  const PhoneParser();

  @override
  Future<List<Phone>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((e) => Phone.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
