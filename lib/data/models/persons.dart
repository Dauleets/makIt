import 'package:json_annotation/json_annotation.dart';

part 'persons.g.dart';

@JsonSerializable()
class PersonEntity {
  final String name;
  final String email;

  PersonEntity({
    required this.name,
    required this.email,
  });

  factory PersonEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PersonEntityToJson(this);

  PersonEntity copyWith({
    String? name,
    String? email,
  }) {
    return PersonEntity(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'PersonEntity(name: $name, email: $email)';
}
