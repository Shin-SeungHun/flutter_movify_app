import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/movie_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
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
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
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
              tabs: const [
                Tab(text: '인기순'),
                Tab(text: '평점순'),
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
                    scrollController: viewModel.popScrollController,
                    movieList: viewModel.popMovieList,
                    onRefresh: () async {
                      await viewModel.fetchPopMovieInfo(query: GenreEnums.pop.genre, page: 1);
                    },
                    genre: GenreEnums.pop.genre,
                  ),
                  MovieGridView(
                    scrollController: viewModel.topScrollController,
                    movieList: viewModel.topMovieList,
                    onRefresh: () async {
                      await viewModel.fetchTopMovieInfo(query: GenreEnums.top.genre, page: 1);
                    },
                    genre: GenreEnums.top.genre,
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
