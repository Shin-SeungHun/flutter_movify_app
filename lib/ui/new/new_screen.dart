import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/movie_grid_view.dart';
import 'package:flutter_movify/ui/new/new_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewViewModel>(
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
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: '현재 상영중'),
                Tab(text: '개봉 예정'),
              ],
            ),
          ),
          body: Stack(
            children: [
              const BackgroundWidget(),
              TabBarView(
                controller: _tabController,
                children: [
                  MovieGridView(
                    scrollController: viewModel.nowPlayingScrollController,
                    movieList: viewModel.nowPlayingMovieList,
                    onRefresh: () async {
                      await viewModel.fetchNowPlayingMovieInfo(query: GenreEnums.nowPlaying.genre, page: 1);
                    },
                    genre: GenreEnums.nowPlaying.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.upComingScrollController,
                    movieList: viewModel.upComingMovieList,
                    onRefresh: () async {
                      await viewModel.fetchUpComingMovieInfo(query: GenreEnums.upComing.genre, page: 1);
                    },
                    genre: GenreEnums.upComing.genre,
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
