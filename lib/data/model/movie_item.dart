import 'package:json_annotation/json_annotation.dart';

class MovieItem {
  @JsonKey(name: 'id')
  final num id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'backDrop_path')
  final String backDropPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final num voteAverage;

//<editor-fold desc="Data Methods">
  const MovieItem({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.posterPath,
    required this.overview,
    required this.backDropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          originalTitle == other.originalTitle &&
          posterPath == other.posterPath &&
          overview == other.overview &&
          backDropPath == other.backDropPath &&
          releaseDate == other.releaseDate &&
          voteAverage == other.voteAverage);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      originalTitle.hashCode ^
      posterPath.hashCode ^
      overview.hashCode ^
      backDropPath.hashCode ^
      releaseDate.hashCode ^
      voteAverage.hashCode;

  @override
  String toString() {
    return 'MovieItem{ id: $id, title: $title, originalTitle: $originalTitle, posterPath: $posterPath, overview: $overview, backDropPath: $backDropPath, releaseDate: $releaseDate, voteAverage: $voteAverage,}';
  }

  MovieItem copyWith({
    num? id,
    String? title,
    String? originalTitle,
    String? posterPath,
    String? overview,
    String? backDropPath,
    String? releaseDate,
    num? voteAverage,
  }) {
    return MovieItem(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      backDropPath: backDropPath ?? this.backDropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'originalTitle': originalTitle,
      'posterPath': posterPath,
      'overview': overview,
      'backDropPath': backDropPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
    };
  }

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      id: json['id'] as num,
      title: json['title'] as String,
      originalTitle: json['originalTitle'] as String,
      posterPath: json['posterPath'] as String,
      overview: json['overview'] as String,
      backDropPath: json['backDropPath'] as String,
      releaseDate: json['releaseDate'] as String,
      voteAverage: json['voteAverage'] as num,
    );
  }

//</editor-fold>
}
