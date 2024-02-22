import 'package:flutter_movify/data/data_source/movie_api.dart';
import 'package:flutter_movify/data/dto/movie_dto.dart';
import 'package:flutter_movify/data/mapper/movie_mapper.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _api = MovieApi();

  @override
  Future<List<MovieItem>> getMovieItems({required String query, required int page}) async {
    await _api.init();
    final MovieDto dto = await _api.getMovieInfoResult(query: query, page: page);

    return dto.results!.map((e) => e.toMovieItem()).toList();
  }

  @override
  Future<List<MovieItem>> searchMovieItems({required String query}) async {
    await _api.init();
    final MovieDto dto = await _api.searchMovieInfoResult(query: query);
    return dto.results!.map((e) => e.toMovieItem()).toList();
  }

  @override
  Future<List<MovieItem>> getOttMovieItems({required int page, required int watchProvider}) async {
    await _api.init();
    final MovieDto dto = await _api.getOttMovieInfoResult(page: page, watchProvider: watchProvider);
    return dto.results!.map((e) => e.toMovieItem()).toList();
  }

  @override
  Future<List<MovieItem>> getGenreMovieItems({required int page, required int genre}) async {
    await _api.init();
    final MovieDto dto = await _api.getGenreMovieInfoResult(page: page, genre: genre);
    return dto.results!.map((e) => e.toMovieItem()).toList();
  }
}
