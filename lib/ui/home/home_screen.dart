import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/image_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
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
                onPressed: () {},
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
                  Scrollbar(
                    controller: _scrollController,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        viewModel.popMovieList;
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: viewModel.popMovieList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 1 개의 행에 보여줄 item 개수
                          childAspectRatio: 0.7, // item 의 가로 세로의 비율
                          mainAxisSpacing: 0, // 수평 Padding
                          crossAxisSpacing: 0, // 수직 Padding
                        ),
                        itemBuilder: (context, index) {
                          final MovieItem movieItem = viewModel.popMovieList[index];
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ImageWidget(movieItem: movieItem),
                          );
                        },
                      ),
                    ),
                  ),
                  Scrollbar(
                    controller: _scrollController,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        viewModel.topMovieList;
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: viewModel.topMovieList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 1 개의 행에 보여줄 item 개수
                          childAspectRatio: 0.7, // item 의 가로 세로의 비율
                          mainAxisSpacing: 0, // 수평 Padding
                          crossAxisSpacing: 0, // 수직 Padding
                        ),
                        itemBuilder: (context, index) {
                          final MovieItem movieItem = viewModel.topMovieList[index];
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ImageWidget(movieItem: movieItem),
                          );
                        },
                      ),
                    ),
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
