import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/home/home_screen.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/info/movie_info_screen.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
          child: const HomeScreen(),
        );
      }),
  GoRoute(
      path: '/movieInfo',
      builder: (context, state) {
        final MovieItem movieItem = state.extra as MovieItem;
        return ChangeNotifierProvider<MovieInfoViewModel>(
          create: (context) => MovieInfoViewModel(movieItem: movieItem),
          child: const MovieInfoScreen(),
        );
      }),
]);
