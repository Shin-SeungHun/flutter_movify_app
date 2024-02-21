import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class NewViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  List<MovieItem> nowPlayingMovieList = [];
  List<MovieItem> upComingMovieList = [];
  final ScrollController _nowPlayingScrollController = ScrollController();
  final ScrollController _upComingScrollController = ScrollController();
  int _nowPlayingPage = 1;
  int _upComingPage = 1;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ScrollController get nowPlayingScrollController => _nowPlayingScrollController;

  ScrollController get upComingScrollController => _upComingScrollController;

  @override
  void dispose() {
    _nowPlayingScrollController.dispose();
    _upComingScrollController.dispose();
    super.dispose();
  }

  NewViewModel() {
    fetchNowPlayingMovieInfo(query: GenreEnums.nowPlaying.genre, page: _nowPlayingPage);
    fetchUpComingMovieInfo(query: GenreEnums.upComing.genre, page: _upComingPage);

    _nowPlayingScrollController.addListener(() {
      if (_nowPlayingScrollController.position.pixels == _nowPlayingScrollController.position.maxScrollExtent) {
        fetchMoreNowPlayingMovies();
      }
    });

    _upComingScrollController.addListener(() {
      if (_upComingScrollController.position.pixels == _upComingScrollController.position.maxScrollExtent) {
        fetchMoreUpComingMovies();
      }
    });
  }

  fetchNowPlayingMovieInfo({required String query, required int page}) async {
    nowPlayingMovieList = await _repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }

  fetchUpComingMovieInfo({required String query, required int page}) async {
    upComingMovieList = await _repository.getMovieItems(query: query, page: page);
    notifyListeners();
  }

  void fetchMoreNowPlayingMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _nowPlayingPage++;
    List<MovieItem> newMovies = await _repository.getMovieItems(query: GenreEnums.nowPlaying.genre, page: _nowPlayingPage);

    // 중복된 아이템 필터링
    List<MovieItem> filteredNewMovies = newMovies.where((newMovie) => !nowPlayingMovieList.contains(newMovie)).toList();

    print(newMovies.map((e) => e.title.toString()));
    nowPlayingMovieList.addAll(filteredNewMovies);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreUpComingMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _upComingPage++;
    List<MovieItem> newMovies = await _repository.getMovieItems(query: GenreEnums.upComing.genre, page: _upComingPage);

    // 중복된 아이템 필터링
    List<MovieItem> filteredNewMovies = newMovies.where((newMovie) => !upComingMovieList.contains(newMovie)).toList();

    upComingMovieList.addAll(filteredNewMovies);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }


}
