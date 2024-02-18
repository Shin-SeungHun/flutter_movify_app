import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({
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
        fit: BoxFit.fitHeight,
        width: double.infinity,
      ),
    );
  }
}
