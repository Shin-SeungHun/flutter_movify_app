import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movify/data/model/cast_item.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/credits_profile_widget.dart';
import 'package:flutter_movify/ui/layout/movie_back_drop_widget.dart';
import 'package:flutter_movify/ui/layout/movie_info_poster_widget.dart';
import 'package:flutter_movify/ui/layout/movie_poster_dialog.dart';
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
                          duration: const Duration(milliseconds: 300),
                          opacity: top < kToolbarHeight * 2.2 ? 1.0 : 0.0,
                          child: Text(
                            viewModel.movieItem.title,
                            style: const TextStyle(color: CupertinoColors.systemYellow, fontWeight: FontWeight.bold),
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
                      const SizedBox(height: 20),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MoviePosterDialog(
                                        movieItem: viewModel.movieItem,
                                      ),
                                    ),
                                  );
                                },
                                child: MovieInfoPosterWidget(movieItem: viewModel.movieItem),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          viewModel.movieItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(viewModel.movieItem.overview),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              '주요 출연진',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250, // 가로 스크롤 가능한 영역을 제한하기 위한 높이 설정
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.castList.length,
                              itemBuilder: (context, index) {
                                final CastItem castItem = viewModel.castList[index];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CreditsProfileWidget(castItem: castItem),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
