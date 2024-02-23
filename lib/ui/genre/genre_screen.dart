import 'package:flutter/material.dart';
import 'package:flutter_movify/common/utils/enum/genre_name_enums.dart';
import 'package:flutter_movify/common/utils/enum/genre_num_enums.dart';
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
              ListView.builder(
                itemCount: GenreNameEnums.values.length,
                itemBuilder: (context, index) {
                  final genreName = GenreNameEnums.values[index];
                  List<MovieItem> genreMovieList = [];
                  switch (index) {
                    case 0:
                      genreMovieList = viewModel.actionList;
                    case 1:
                      genreMovieList = viewModel.adventureList;
                    case 2:
                      genreMovieList = viewModel.animationList;
                    case 3:
                      genreMovieList = viewModel.comedyList;
                    case 4:
                      genreMovieList = viewModel.crimeList;
                    case 5:
                      genreMovieList = viewModel.documentaryList;
                    case 6:
                      genreMovieList = viewModel.dramaList;
                    case 7:
                      genreMovieList = viewModel.familyList;
                    case 8:
                      genreMovieList = viewModel.fantasyList;
                    case 9:
                      genreMovieList = viewModel.historyList;
                    case 10:
                      genreMovieList = viewModel.horrorList;
                    case 11:
                      genreMovieList = viewModel.musicList;
                    case 12:
                      genreMovieList = viewModel.mysteryList;
                    case 13:
                      genreMovieList = viewModel.romanceList;
                    case 14:
                      genreMovieList = viewModel.sfList;
                    case 15:
                      genreMovieList = viewModel.tvMovieList;
                    case 16:
                      genreMovieList = viewModel.thrillerList;
                    case 17:
                      genreMovieList = viewModel.warList;
                    case 18:
                      genreMovieList = viewModel.westernList;
                      break;
                    default:
                      break;
                  }
                  return ListTile(
                    title: Text(genreName.genreName,style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    subtitle: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        // controller: viewModel.actionScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: genreMovieList.length,
                        itemBuilder: (context, index) {
                          final movieItem = genreMovieList[index];
                          // final MovieItem movieItem = viewModel.actionList[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/movieInfo', extra: movieItem);
                            },
                            child: SizedBox(
                              width: 140,
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
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
