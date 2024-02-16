import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/layout/image_widget.dart';

class MovieGridView extends StatelessWidget {
  final ScrollController scrollController;
  final List<MovieItem> movieList;
  final Future<void> Function() onRefresh;
  final String genre;

  const MovieGridView({
    Key? key,
    required this.scrollController,
    required this.movieList,
    required this.onRefresh,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 한 행에 2개의 아이템
          childAspectRatio: 0.7, // 아이템의 가로 세로 비율
          mainAxisSpacing: 8.0, // 수평 간격
          crossAxisSpacing: 8.0, // 수직 간격
        ),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final MovieItem movieItem = movieList[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: ImageWidget(movieItem: movieItem),
          );
        },
      ),
    );
  }
}
