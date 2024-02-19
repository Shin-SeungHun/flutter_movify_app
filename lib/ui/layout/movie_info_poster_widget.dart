import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';

class MovieInfoPosterWidget extends StatelessWidget {
  const MovieInfoPosterWidget({
    super.key,
    required this.movieItem,
  });

  final MovieItem movieItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: _buildPosterImage(),
    );
  }

  Widget _buildPosterImage() {
    if (movieItem.posterPath.isNotEmpty) {
      return Image.network(
        'https://image.tmdb.org/t/p/w500${movieItem.posterPath}',
        fit: BoxFit.cover,
        width: 130,
        height: 180,
      );
    } else {
      // posterPath가 없을 때 대체할 이미지
      return Image.asset(
        'assets/images/no_poster_image.png',
        fit: BoxFit.cover,
        width: 130,
        height: 180,
      );
    }
  }
}
