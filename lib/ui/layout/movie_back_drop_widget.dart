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

      child: _buildBackDropImage(),
    );
  }

  Widget _buildBackDropImage() {
    if (movieItem.posterPath.isNotEmpty) {
      return Image.network(
        'https://image.tmdb.org/t/p/w500${movieItem.backDropPath}',
        fit: BoxFit.cover,
        width: double.infinity,
      );
    } else {
      // backDropPath가 없을 때 대체할 이미지
      return Image.asset(
        'assets/images/no_back_drop_image.jpeg',
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
  }
}
