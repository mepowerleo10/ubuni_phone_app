import 'package:json_annotation/json_annotation.dart';

part 'phone.g.dart';

@JsonSerializable()
class Phone {
  final int id;
  final String name;

  @JsonKey(name: 'Brand')
  final String brand;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  const Phone(this.id, this.name, this.brand, this.imageUrl);

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
