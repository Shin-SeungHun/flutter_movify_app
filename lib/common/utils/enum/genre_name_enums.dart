enum GenreNameEnums {
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

extension GenreNameEnumsExtension on GenreNameEnums {
  String get genreName {
    switch (this) {
      case GenreNameEnums.action:
        return '액션';
      case GenreNameEnums.adventure:
        return '모험';
      case GenreNameEnums.animation:
        return '애니메이션';
      case GenreNameEnums.comedy:
        return '코미디';
      case GenreNameEnums.crime:
        return '범죄';
      case GenreNameEnums.documentary:
        return '다큐멘터리';
      case GenreNameEnums.drama:
        return '드라마';
      case GenreNameEnums.family:
        return '가족';
      case GenreNameEnums.fantasy:
        return '판타지';
      case GenreNameEnums.history:
        return '역사';
      case GenreNameEnums.horror:
        return '공포';
      case GenreNameEnums.music:
        return '음악';
      case GenreNameEnums.mystery:
        return '미스터리';
      case GenreNameEnums.romance:
        return '로멘스';
      case GenreNameEnums.sf:
        return 'sf';
      case GenreNameEnums.tvMovie:
        return 'tv 영화';
      case GenreNameEnums.thriller:
        return '스릴러';
      case GenreNameEnums.war:
        return '전쟁';
      case GenreNameEnums.western:
        return '서부';
      default:
        return '';
    }
  }
}
