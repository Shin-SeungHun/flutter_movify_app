import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class SearchViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();
  List<MovieItem> _movieItemList = [];

  List<MovieItem> get movieItemList => _movieItemList;

  searchImage(String query) async {
    notifyListeners();
    _movieItemList = await _repository.searchMovieItems(query: query);
    notifyListeners();
  }
}
