import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/movie_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class NewViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  List<MovieItem> nowPlayingMovieList = [];
  List<MovieItem> upComingMovieList = [];
  final ScrollController _nowPlayingScrollController = ScrollController();
  final ScrollController _upComingScrollController = ScrollController();
  int _page = 1;

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
    fetchNowPlayingMovieInfo(query: MovieEnums.nowPlaying.movie, page: _page);
    fetchUpComingMovieInfo(query: MovieEnums.upComing.movie, page: _page);

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
    _page++;
    List<MovieItem> newMovieList = await _repository.getMovieItems(query: MovieEnums.nowPlaying.movie, page: _page);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !nowPlayingMovieList.contains(newMovie));

    nowPlayingMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreUpComingMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList = await _repository.getMovieItems(query: MovieEnums.upComing.movie, page: _page);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !upComingMovieList.contains(newMovie));

    upComingMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }


}
