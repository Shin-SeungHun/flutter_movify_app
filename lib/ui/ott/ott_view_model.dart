import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/common/utils/enum/watch_provider_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/movie_repository_impl.dart';

class OttViewModel extends ChangeNotifier {
  final MovieRepositoryImpl _repository = MovieRepositoryImpl();

  List<MovieItem> netflixMovieList = [];
  List<MovieItem> watchaMovieList = [];
  List<MovieItem> disneyMovieList = [];
  List<MovieItem> wavveMovieList = [];
  List<MovieItem> amazonMovieList = [];
  List<MovieItem> appleMovieList = [];
  int _page = 1;

  int get page => _page;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final ScrollController _netflixScrollController = ScrollController();
  final ScrollController _watchaScrollController = ScrollController();
  final ScrollController _disneyScrollController = ScrollController();
  final ScrollController _wavveScrollController = ScrollController();
  final ScrollController _amazonScrollController = ScrollController();
  final ScrollController _appleScrollController = ScrollController();

  ScrollController get netflixScrollController => _netflixScrollController;

  ScrollController get watchaScrollController => _watchaScrollController;

  ScrollController get disneyScrollController => _disneyScrollController;

  ScrollController get wavveScrollController => _wavveScrollController;

  ScrollController get amazonScrollController => _amazonScrollController;

  ScrollController get appleScrollController => _appleScrollController;

  @override
  void dispose() {
    _netflixScrollController.dispose();
    _watchaScrollController.dispose();
    _disneyScrollController.dispose();
    _wavveScrollController.dispose();
    _amazonScrollController.dispose();
    _appleScrollController.dispose();
    super.dispose();
  }

  OttViewModel() {
    fetchNetflixMovieInfo(watchProvider: WatchProviderEnums.netflix.watchProvider, page: _page);
    fetchWatchaMovieInfo(watchProvider: WatchProviderEnums.watcha.watchProvider, page: _page);
    fetchDisneyMovieInfo(watchProvider: WatchProviderEnums.disney.watchProvider, page: _page);
    fetchWavveMovieInfo(watchProvider: WatchProviderEnums.wavve.watchProvider, page: _page);
    fetchAmazonMovieInfo(watchProvider: WatchProviderEnums.amazon.watchProvider, page: _page);
    fetchAppleMovieInfo(watchProvider: WatchProviderEnums.apple.watchProvider, page: _page);

    _netflixScrollController.addListener(() {
      if (_netflixScrollController.position.pixels == _netflixScrollController.position.maxScrollExtent) {
        fetchMoreNetflixMovies();
      }
    });
    _watchaScrollController.addListener(() {
      if (_watchaScrollController.position.pixels == _watchaScrollController.position.maxScrollExtent) {
        fetchMoreWatchaMovies();
      }
    });
    _disneyScrollController.addListener(() {
      if (_disneyScrollController.position.pixels == _disneyScrollController.position.maxScrollExtent) {
        fetchMoreDisneyMovies();
      }
    });
    _wavveScrollController.addListener(() {
      if (_wavveScrollController.position.pixels == _wavveScrollController.position.maxScrollExtent) {
        fetchMoreWavveMovies();
      }
    });
    _amazonScrollController.addListener(() {
      if (_amazonScrollController.position.pixels == _amazonScrollController.position.maxScrollExtent) {
        fetchMoreAmazonMovies();
      }
    });
    _appleScrollController.addListener(() {
      if (_appleScrollController.position.pixels == _appleScrollController.position.maxScrollExtent) {
        fetchMoreAppleMovies();
      }
    });
  }

  fetchNetflixMovieInfo({required int page, required int watchProvider}) async {
    netflixMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  fetchWatchaMovieInfo({required int page, required int watchProvider}) async {
    watchaMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  fetchDisneyMovieInfo({required int page, required int watchProvider}) async {
    disneyMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  fetchWavveMovieInfo({required int page, required int watchProvider}) async {
    wavveMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  fetchAmazonMovieInfo({required int page, required int watchProvider}) async {
    amazonMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  fetchAppleMovieInfo({required int page, required int watchProvider}) async {
    appleMovieList = await _repository.getOttMovieItems(page: page, watchProvider: watchProvider);
    notifyListeners();
  }

  void fetchMoreNetflixMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.netflix.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !netflixMovieList.contains(newMovie));

    netflixMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreWatchaMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.watcha.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !watchaMovieList.contains(newMovie));

    watchaMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreDisneyMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.disney.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !disneyMovieList.contains(newMovie));

    disneyMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreWavveMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.wavve.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !wavveMovieList.contains(newMovie));

    wavveMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreAmazonMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.amazon.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !amazonMovieList.contains(newMovie));

    amazonMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }

  void fetchMoreAppleMovies() async {
    // _isLoading = true; // 로딩 시작
    // notifyListeners();
    _page++;
    List<MovieItem> newMovieList =
        await _repository.getOttMovieItems(page: _page, watchProvider: WatchProviderEnums.apple.watchProvider);

    // 중복된 아이템 필터링
    newMovieList.retainWhere((newMovie) => !appleMovieList.contains(newMovie));

    appleMovieList.addAll(newMovieList);
    // _isLoading = false; // 로딩 완료
    notifyListeners();
  }
}
