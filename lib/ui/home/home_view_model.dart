import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepositoryImpl repository = MovieRepositoryImpl();

  List<MovieItem> movieItemList = [];
  int page = 1;

  HomeViewModel() {
    fetchMovieInfo(query: GenreEnums.pop.genre, page: page);
  }

  fetchMovieInfo({required String query, required int page}) async {
    notifyListeners();
    movieItemList = await repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }
}
