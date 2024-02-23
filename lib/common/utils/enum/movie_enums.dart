enum MovieEnums {
  pop,
  top,
  upComing,
  nowPlaying,

}

extension MovieEnumsExtension on MovieEnums {
  String get movie {
    switch (this) {
      case MovieEnums.pop:
        return 'popular';
      case MovieEnums.top:
        return 'top_rated';
      case MovieEnums.upComing:
        return 'upcoming';
      case MovieEnums.nowPlaying:
        return 'now_playing';
      default:
        return '';
    }
  }

}
