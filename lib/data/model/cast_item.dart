import 'package:json_annotation/json_annotation.dart';

class CastItem {
  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'gender')
  final num gender;

  @JsonKey(name: 'id')
  final num id;

  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'original_name')
  final String originalName;

  @JsonKey(name: 'profile_path')
  final num popularity;

  @JsonKey(name: 'profile_path')
  final String profilePath;

  @JsonKey(name: 'cast_id')
  final num castId;

  @JsonKey(name: 'character')
  final String character;

  @JsonKey(name: 'credit_id')
  final String creditId;

  @JsonKey(name: 'order')
  final num order;

//<editor-fold desc="Data Methods">
  CastItem({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CastItem &&
          runtimeType == other.runtimeType &&
          adult == other.adult &&
          gender == other.gender &&
          id == other.id &&
          knownForDepartment == other.knownForDepartment &&
          name == other.name &&
          originalName == other.originalName &&
          popularity == other.popularity &&
          profilePath == other.profilePath &&
          castId == other.castId &&
          character == other.character &&
          creditId == other.creditId &&
          order == other.order);

  @override
  int get hashCode =>
      adult.hashCode ^
      gender.hashCode ^
      id.hashCode ^
      knownForDepartment.hashCode ^
      name.hashCode ^
      originalName.hashCode ^
      popularity.hashCode ^
      profilePath.hashCode ^
      castId.hashCode ^
      character.hashCode ^
      creditId.hashCode ^
      order.hashCode;

  @override
  String toString() {
    return 'CastItem{ adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order,}';
  }

  CastItem copyWith({
    bool? adult,
    num? gender,
    num? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    num? popularity,
    String? profilePath,
    num? castId,
    String? character,
    String? creditId,
    num? order,
  }) {
    return CastItem(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      castId: castId ?? this.castId,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'originalName': originalName,
      'popularity': popularity,
      'profilePath': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
    };
  }

  factory CastItem.fromJson(Map<String, dynamic> json) {
    return CastItem(
      adult: json['adult'] as bool,
      gender: json['gender'] as num,
      id: json['id'] as num,
      knownForDepartment: json['knownForDepartment'] as String,
      name: json['name'] as String,
      originalName: json['originalName'] as String,
      popularity: json['popularity'] as num,
      profilePath: json['profilePath'] as String,
      castId: json['castId'] as num,
      character: json['character'] as String,
      creditId: json['creditId'] as String,
      order: json['order'] as num,
    );
  }

//</editor-fold>
}
