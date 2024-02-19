import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/layout/movie_poster_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieListItem extends StatelessWidget {
  final MovieItem movieItem;

  const MovieListItem({Key? key, required this.movieItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF212D3B),
      elevation: 3.0,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 135.0,
            height: 200.0,
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: MoviePosterWidget(movieItem: movieItem),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieItem.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: movieItem.voteAverage / 2,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // 별점 업데이트 처리
                        },
                      ),
                    ],
                  ),
                  subtitle: Text(
                    movieItem.overview,
                    textAlign: TextAlign.left,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
