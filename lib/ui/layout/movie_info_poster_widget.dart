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
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movieItem.posterPath}',
        fit: BoxFit.cover,
        width: 160,
        height: 230,
      ),
    );
  }
}
