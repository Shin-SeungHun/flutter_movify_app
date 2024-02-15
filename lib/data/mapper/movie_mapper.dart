import 'package:flutter_movify/data/dto/movie_dto.dart';
import 'package:flutter_movify/data/model/movie_item.dart';

extension DtoToModel on Results {
  MovieItem toMovieItem() {
    return MovieItem(
        id: id ?? 0,
        title: title ?? '',
        originalTitle: originalTitle ?? '',
        posterPath: posterPath ?? '',
        overview: overview ?? '',
        backDropPath: backdropPath ?? '',
        releaseDate: releaseDate ?? '',
        voteAverage: voteAverage ?? 0);
  }
}
