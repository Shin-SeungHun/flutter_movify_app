import 'package:flutter_movify/data/model/movie_item.dart';

abstract interface class MovieRepository {
  Future<List<MovieItem>> getMovieItems({required String query, required int page});
  Future<List<MovieItem>> searchMovieItems({required String query});
  Future<List<MovieItem>> getOttMovieItems({required int page, required int watchProvider});

}
