enum GenreEnums {
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
  western,
  war,
}

extension GenreEnumsExtension on GenreEnums {
  int get genre {
    switch (this) {
      case GenreEnums.action:
        return 28;
      case GenreEnums.adventure:
        return 12;
      case GenreEnums.animation:
        return 16;
      case GenreEnums.comedy:
        return 35;
      case GenreEnums.crime:
        return 80;
      case GenreEnums.documentary:
        return 99;
      case GenreEnums.drama:
        return 18;
      case GenreEnums.family:
        return 10751;
      case GenreEnums.fantasy:
        return 14;
      case GenreEnums.history:
        return 36;
      case GenreEnums.horror:
        return 27;
      case GenreEnums.music:
        return 10402;
      case GenreEnums.mystery:
        return 9648;
      case GenreEnums.romance:
        return 10749;
      case GenreEnums.sf:
        return 878;
      case GenreEnums.tvMovie:
        return 10770;
      case GenreEnums.thriller:
        return 53;
      case GenreEnums.western:
        return 10752;
      case GenreEnums.war:
        return 37;
    }
  }
}
