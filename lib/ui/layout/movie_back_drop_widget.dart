import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({
    super.key,
    required this.movieItem,
  });

  final MovieItem movieItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movieItem.backDropPath}',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
