import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_num_enums.dart';
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

  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();
  final ScrollController _scrollController4 = ScrollController();
  final ScrollController _scrollController5 = ScrollController();
  final ScrollController _scrollController6 = ScrollController();
  final ScrollController _scrollController7 = ScrollController();
  final ScrollController _scrollController8 = ScrollController();
  final ScrollController _scrollController9 = ScrollController();
  final ScrollController _scrollController10 = ScrollController();
  final ScrollController _scrollController11 = ScrollController();
  final ScrollController _scrollController12 = ScrollController();
  final ScrollController _scrollController13 = ScrollController();
  final ScrollController _scrollController14 = ScrollController();
  final ScrollController _scrollController15 = ScrollController();
  final ScrollController _scrollController16 = ScrollController();
  final ScrollController _scrollController17 = ScrollController();
  final ScrollController _scrollController18 = ScrollController();

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
    _scrollController5.dispose();
    _scrollController6.dispose();
    _scrollController7.dispose();
    _scrollController8.dispose();
    _scrollController9.dispose();
    _scrollController10.dispose();
    _scrollController11.dispose();
    _scrollController12.dispose();
    _scrollController13.dispose();
    _scrollController14.dispose();
    _scrollController15.dispose();
    _scrollController16.dispose();
    _scrollController17.dispose();
    _scrollController18.dispose();
    super.dispose();
  }

  int _page = 1;

  GenreViewModel() {
    _fetchGenreMovies();

  }

  Future<void> _fetchGenreMovies() async {
    for (var genre in GenreNumEnums.values) {
      List<MovieItem> genreMovieList = await _repository.getGenreMovieItems(page: _page, genre: genre.genreNum);

      switch (genre) {
        case GenreNumEnums.action:
          actionList = genreMovieList;
          break;
        case GenreNumEnums.adventure:
          adventureList = genreMovieList;
          break;
        case GenreNumEnums.animation:
          animationList = genreMovieList;
          break;
        case GenreNumEnums.comedy:
          comedyList = genreMovieList;
          break;
        case GenreNumEnums.crime:
          crimeList = genreMovieList;
          break;
        case GenreNumEnums.documentary:
          documentaryList = genreMovieList;
          break;
        case GenreNumEnums.drama:
          dramaList = genreMovieList;
          break;
        case GenreNumEnums.family:
          familyList = genreMovieList;
          break;
        case GenreNumEnums.fantasy:
          fantasyList = genreMovieList;
          break;
        case GenreNumEnums.history:
          historyList = genreMovieList;
          break;
        case GenreNumEnums.horror:
          horrorList = genreMovieList;
          break;
        case GenreNumEnums.music:
          musicList = genreMovieList;
          break;
        case GenreNumEnums.mystery:
          mysteryList = genreMovieList;
          break;
        case GenreNumEnums.romance:
          romanceList = genreMovieList;
          break;
        case GenreNumEnums.sf:
          sfList = genreMovieList;
          break;
        case GenreNumEnums.tvMovie:
          tvMovieList = genreMovieList;
          break;
        case GenreNumEnums.thriller:
          thrillerList = genreMovieList;
          break;
        case GenreNumEnums.war:
          warList = genreMovieList;
          break;
        case GenreNumEnums.western:
          westernList = genreMovieList;
          break;
        default:
          break;
      }
    }
    notifyListeners();
  }
}
