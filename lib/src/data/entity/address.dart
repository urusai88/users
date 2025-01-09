import 'package:json_annotation/json_annotation.dart';
import 'package:tio/tio.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(JsonMap json) => _$AddressFromJson(json);

  final String street;
  final String suite;
  final String city;
  final String zipcode;

  final AddressGeo geo;
}

@JsonSerializable()
class AddressGeo {
  const AddressGeo({
    required this.lat,
    required this.lng,
  });

  factory AddressGeo.fromJson(JsonMap json) => _$AddressGeoFromJson(json);

  final String lat;
  final String lng;
}
