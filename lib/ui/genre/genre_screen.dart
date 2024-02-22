import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_enums.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/genre/genre_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/movie_poster_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> with SingleTickerProviderStateMixin {
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
    return Consumer<GenreViewModel>(
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
          ),
          body: Stack(
            children: [
              const BackgroundWidget(),
              // ListView.builder(
              //   itemCount: GenreEnums.values.length,
              //   itemBuilder: (context, index) {
                   ListView.builder(
                    controller: viewModel.actionScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.actionList.length,
                    itemBuilder: (context, index) {
                      final MovieItem movieItem = viewModel.actionList[index];
                      return GestureDetector(
                        onTap: () {
                          context.push('/movieInfo', extra: movieItem);
                        },
                        child: Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MoviePosterWidget(movieItem: movieItem),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                                    // );
                                  // },
                                ],
          ),
        );
      },
    );
  }
}
