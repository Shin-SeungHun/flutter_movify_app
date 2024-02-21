import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/common/utils/enum/watch_provider_enums.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/movie_grid_view.dart';
import 'package:flutter_movify/ui/ott/ott_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class OttScreen extends StatefulWidget {
  const OttScreen({super.key});

  @override
  State<OttScreen> createState() => _OttScreenState();
}

class _OttScreenState extends State<OttScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> ottList = ['NETFLIX', 'WATCHA', 'DISNEY+', 'WAVVE', 'AMAZON', 'APPLE TV'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: ottList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OttViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: RiveAnimation.asset(
                    'assets/rive/cat.riv',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            title: const Text('Movie Finder'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  context.push('/search');
                },
                icon: const Icon(Icons.search),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,

              tabs: ottList.map((e) => Tab(text: e)).toList(),
            ),
          ),
          body: Stack(
            children: [
              const BackgroundWidget(),
              TabBarView(
                controller: _tabController,
                children: [
                  MovieGridView(
                    scrollController: viewModel.netflixScrollController,
                    movieList: viewModel.netflixMovieList,
                    onRefresh: () async {
                      await viewModel.fetchNetflixMovieInfo(
                          watchProvider: WatchProviderEnums.netflix.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.watchaScrollController,
                    movieList: viewModel.watchaMovieList,
                    onRefresh: () async {
                      await viewModel.fetchWatchaMovieInfo(
                          watchProvider: WatchProviderEnums.watcha.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.disneyScrollController,
                    movieList: viewModel.disneyMovieList,
                    onRefresh: () async {
                      await viewModel.fetchWatchaMovieInfo(
                          watchProvider: WatchProviderEnums.disney.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.wavveScrollController,
                    movieList: viewModel.wavveMovieList,
                    onRefresh: () async {
                      await viewModel.fetchWatchaMovieInfo(
                          watchProvider: WatchProviderEnums.wavve.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.amazonScrollController,
                    movieList: viewModel.amazonMovieList,
                    onRefresh: () async {
                      await viewModel.fetchWatchaMovieInfo(
                          watchProvider: WatchProviderEnums.amazon.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.appleScrollController,
                    movieList: viewModel.appleMovieList,
                    onRefresh: () async {
                      await viewModel.fetchWatchaMovieInfo(
                          watchProvider: WatchProviderEnums.apple.watchProvider, page: 1);
                    },
                    genre: GenreEnums.ott.genre,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
