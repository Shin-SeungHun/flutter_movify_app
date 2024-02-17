import 'package:flutter/material.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:flutter_movify/ui/layout/image_widget.dart';
import 'package:provider/provider.dart';

class MovieInfoScreen extends StatefulWidget {

  const MovieInfoScreen({super.key});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieInfoViewModel>(
      builder: (BuildContext context, MovieInfoViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(viewModel.movieItem.title.toString()),
          ),
          body: Container(
            child: Hero(
              tag: viewModel.movieItem.id,
              child: ImageWidget(movieItem: viewModel.movieItem),
            ),
          ),
        );
      },
    );
  }
}
