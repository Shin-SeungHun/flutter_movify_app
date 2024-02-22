import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/common/utils/enum/movie_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class GenreViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  List<MovieItem> actionList = [];
  List<MovieItem> adventureList = [];
  List<MovieItem> animationList = [];
  List<MovieItem> comedyList = [];
  List<MovieItem> crimeList = [];
  List<MovieItem> documentaryList = [];
  List<MovieItem> dramaList = [];
  List<MovieItem> familyList = [];
  List<MovieItem> fantasyList = [];
  List<MovieItem> historyList = [];
  List<MovieItem> horrorList = [];
  List<MovieItem> musicList = [];
  List<MovieItem> mysteryList = [];
  List<MovieItem> romanceList = [];
  List<MovieItem> sfList = [];
  List<MovieItem> tvMovieList = [];
  List<MovieItem> thrillerList = [];
  List<MovieItem> warList = [];
  List<MovieItem> westernList = [];

  final ScrollController _actionScrollController = ScrollController();
  final ScrollController _adventureScrollController = ScrollController();
  int _page = 1;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ScrollController get actionScrollController => _actionScrollController;

  ScrollController get adventureScrollController => _adventureScrollController;

  @override
  void dispose() {
    _actionScrollController.dispose();
    _adventureScrollController.dispose();
    super.dispose();
  }

  GenreViewModel() {
    fetchPopMovieInfo(page: _page, genre: GenreEnums.action.genre);

    _actionScrollController.addListener(() {
      if (_actionScrollController.position.pixels == _actionScrollController.position.maxScrollExtent) {
        fetchMoreActionMovies();
      }
    });

    _adventureScrollController.addListener(() {
      if (_adventureScrollController.position.pixels == _adventureScrollController.position.maxScrollExtent) {
        fetchMoreAdventureMovies();
      }
    });
  }

  fetchPopMovieInfo({required int page, required int genre}) async {
    actionList = await _repository.getGenreMovieItems(page: page, genre: genre);
    notifyListeners();
  }

  fetchTopMovieInfo({required int page, required int genre}) async {
    adventureList = await _repository.getGenreMovieItems(page: page, genre: genre);
    notifyListeners();
  }

  void fetchMoreActionMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList = await _repository.getGenreMovieItems(page: _page, genre: GenreEnums.action.genre);
    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !actionList.contains(newMovie));

    actionList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreAdventureMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList = await _repository.getGenreMovieItems(page: _page, genre: GenreEnums.adventure.genre);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !adventureList.contains(newMovie));

    adventureList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }
}
