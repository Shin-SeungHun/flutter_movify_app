import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';

class MoviePosterDialog extends StatelessWidget {
  final MovieItem movieItem;

  const MoviePosterDialog({Key? key, required this.movieItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: movieItem.id, // 위젯과 동일한 태그를 사용
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movieItem.posterPath}',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width, // 화면 전체 너비
              height: MediaQuery.of(context).size.height, // 화면 전체 높이
            ),
          ),
        ),
      ),
    );
  }
}