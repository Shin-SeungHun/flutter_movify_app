import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/movie_back_drop_widget.dart';
import 'package:flutter_movify/ui/layout/movie_info_poster_widget.dart';
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
          // appBar: AppBar(
          //   title: Text(viewModel.movieItem.title.toString()),
          // ),
          // body: Container(
          //   child: Hero(
          //     tag: viewModel.movieItem.id,
          //     child: ImageWidget(movieItem: viewModel.movieItem),
          //   ),
          // ),
          body: Stack(children: [
            const BackgroundWidget(),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  backgroundColor: Colors.black,
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: top < kToolbarHeight * 2.2 ? 1.0 : 0.0,
                          child: Text(
                            viewModel.movieItem.title,
                            style: TextStyle(color: CupertinoColors.systemYellow, fontWeight: FontWeight.bold),
                          ),
                        ),
                        background: MovieBackDropWidget(movieItem: viewModel.movieItem),
                      );
                    },
                  ),
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 30),
                      MovieInfoPosterWidget(movieItem: viewModel.movieItem),
                      ListTile(
                        title: Text(
                          viewModel.movieItem.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(title: Text(viewModel.movieItem.overview)),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
