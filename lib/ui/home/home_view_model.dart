import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  List<MovieItem> popMovieList = [];
  List<MovieItem> topMovieList = [];
  final ScrollController _popScrollController = ScrollController();
  final ScrollController _topScrollController = ScrollController();
  int _page = 1;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ScrollController get popScrollController => _popScrollController;

  ScrollController get topScrollController => _topScrollController;

  @override
  void dispose() {
    _popScrollController.dispose();
    _topScrollController.dispose();
    super.dispose();
  }

  HomeViewModel() {
    fetchPopMovieInfo(query: GenreEnums.pop.genre, page: _page);
    fetchTopMovieInfo(query: GenreEnums.top.genre, page: _page);

    _popScrollController.addListener(() {
      if (_popScrollController.position.pixels == _popScrollController.position.maxScrollExtent) {
        fetchMorePopMovies();
      }
    });

    _topScrollController.addListener(() {
      if (_topScrollController.position.pixels == _topScrollController.position.maxScrollExtent) {
        fetchMoreTopMovies();
      }
    });
  }

  fetchPopMovieInfo({required String query, required int page}) async {
    popMovieList = await _repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }

  fetchTopMovieInfo({required String query, required int page}) async {
    topMovieList = await _repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }

  void fetchMorePopMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList = await _repository.getMovieItems(query: GenreEnums.pop.genre, page: _page);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !popMovieList.contains(newMovie));

    popMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreTopMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList = await _repository.getMovieItems(query: GenreEnums.top.genre, page: _page);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !topMovieList.contains(newMovie));

    topMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }
}
