import 'package:json_annotation/json_annotation.dart';
import 'package:tio/tio.dart';

import 'address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(JsonMap json) => _$UserFromJson(json);

  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
}
