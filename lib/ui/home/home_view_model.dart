import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepositoryImpl repository = MovieRepositoryImpl();

  List<MovieItem> popMovieList = [];
  List<MovieItem> topMovieList = [];
  int page = 1;

  HomeViewModel() {
    fetchPopMovieInfo(query: GenreEnums.pop.genre, page: page);
    fetchTopMovieInfo(query: GenreEnums.top.genre, page: page);
  }

  fetchPopMovieInfo({required String query, required int page}) async {
    notifyListeners();
    popMovieList = await repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }

  fetchTopMovieInfo({required String query, required int page}) async {
    notifyListeners();
    topMovieList = await repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }
}
