import 'package:json_annotation/json_annotation.dart';
import 'package:tio/tio.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(JsonMap json) => _$CompanyFromJson(json);

  final String name;
  final String catchPhrase;
  final String bs;
}
