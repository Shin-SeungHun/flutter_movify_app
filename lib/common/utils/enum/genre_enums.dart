enum GenreEnums {
  pop,
  top,
  upComing,
  nowPlaying,

}

extension GenreEnumsExtension on GenreEnums {
  String get genre {
    switch (this) {
      case GenreEnums.pop:
        return 'popular';
      case GenreEnums.top:
        return 'top_rated';
      case GenreEnums.upComing:
        return 'upcoming';
      case GenreEnums.nowPlaying:
        return 'now_playing';
    }
  }
}
