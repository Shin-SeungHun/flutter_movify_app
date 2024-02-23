enum GenreNumEnums {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  sf,
  tvMovie,
  thriller,
  war,
  western,
}

extension GenreNumEnumsExtension on GenreNumEnums {
  int get genreNum {
    switch (this) {
      case GenreNumEnums.action:
        return 28;
      case GenreNumEnums.adventure:
        return 12;
      case GenreNumEnums.animation:
        return 16;
      case GenreNumEnums.comedy:
        return 35;
      case GenreNumEnums.crime:
        return 80;
      case GenreNumEnums.documentary:
        return 99;
      case GenreNumEnums.drama:
        return 18;
      case GenreNumEnums.family:
        return 10751;
      case GenreNumEnums.fantasy:
        return 14;
      case GenreNumEnums.history:
        return 36;
      case GenreNumEnums.horror:
        return 27;
      case GenreNumEnums.music:
        return 10402;
      case GenreNumEnums.mystery:
        return 9648;
      case GenreNumEnums.romance:
        return 10749;
      case GenreNumEnums.sf:
        return 878;
      case GenreNumEnums.tvMovie:
        return 10770;
      case GenreNumEnums.thriller:
        return 53;
      case GenreNumEnums.war:
        return 37;
      case GenreNumEnums.western:
        return 10752;
      default:
        return 0;
    }
  }
}
