import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/genre/genre_screen.dart';
import 'package:flutter_movify/ui/genre/genre_view_model.dart';
import 'package:flutter_movify/ui/home/home_screen.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:flutter_movify/ui/info/movie_info_screen.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:flutter_movify/ui/layout/bottom_navigation.dart';
import 'package:flutter_movify/ui/new/new_screen.dart';
import 'package:flutter_movify/ui/new/new_view_model.dart';
import 'package:flutter_movify/ui/ott/ott_screen.dart';
import 'package:flutter_movify/ui/ott/ott_view_model.dart';
import 'package:flutter_movify/ui/search/search_screen.dart';
import 'package:flutter_movify/ui/search/search_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> ottTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> newTabNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> genreTabNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  static const String kHomePath = '/';
  static const String kOttPath = '/ott';
  static const String kNewPath = '/new';
  static const String kGenrePath = '/genre';
  static const String kSearchPath = '/search';
  static const String kBookmarkPath = '/bookmark';
  static const String kMovieInfoPath = '/movieInfo';

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(branches: [
        StatefulShellBranch(navigatorKey: homeTabNavigatorKey, routes: [
          GoRoute(
              path: kHomePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                    child: ChangeNotifierProvider(
                      create: (context) => HomeViewModel(),
                      child: const HomeScreen(),
                    ),
                    state: state);
              })
        ]),
        StatefulShellBranch(navigatorKey: ottTabNavigatorKey, routes: [
          GoRoute(
              path: kOttPath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                    child: ChangeNotifierProvider(
                      create: (context) => OttViewModel(),
                      child: const OttScreen(),
                    ),
                    state: state);
              })
        ]),
        StatefulShellBranch(navigatorKey: newTabNavigatorKey, routes: [
          GoRoute(
              path: kNewPath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                    child: ChangeNotifierProvider(
                      create: (context) => NewViewModel(),
                      child: const NewScreen(),
                    ),
                    state: state);
              })
        ]),
        StatefulShellBranch(navigatorKey: genreTabNavigatorKey, routes: [
          GoRoute(
              path: kGenrePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                    child: ChangeNotifierProvider(
                      create: (context) => GenreViewModel(),
                      child: const GenreScreen(),
                    ),
                    state: state);
              })
        ]),
      ],
        pageBuilder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
            ) {
          // 페이지를 반환하는 메서드를 호출
          return getPage(
            child: BottomNavigation(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
          path: kMovieInfoPath,
          pageBuilder: (context, state) {
            final MovieItem movieItem = state.extra as MovieItem;
            return getPage(
              child: ChangeNotifierProvider<MovieInfoViewModel>(
                create: (context) => MovieInfoViewModel(movieItem: movieItem),
                child: const MovieInfoScreen(),
              ),
              state: state,
            );
          }),
      GoRoute(
          path: kSearchPath,
          pageBuilder: (context, state) {
            return getPage(
              child: ChangeNotifierProvider<SearchViewModel>(
                create: (context) => SearchViewModel(),
                child: const SearchScreen(),
              ),
              state: state,
            );
          }),
    ];

    router = GoRouter(
      initialLocation: kHomePath,
      routes: routes,
    );
  }

// 페이지를 빌드하고 반환.
  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}

// final router = GoRouter(initialLocation: '/', routes: [
//   GoRoute(
//       path: '/',
//       builder: (context, state) {
//         return ChangeNotifierProvider<HomeViewModel>(
//           create: (context) => HomeViewModel(),
//           child: const HomeScreen(),
//         );
//       }),
//   GoRoute(
//       path: '/movieInfo',
//       builder: (context, state) {
//         final MovieItem movieItem = state.extra as MovieItem;
//         return ChangeNotifierProvider<MovieInfoViewModel>(
//           create: (context) => MovieInfoViewModel(movieItem: movieItem),
//           child: const MovieInfoScreen(),
//         );
//       }),
//   GoRoute(
//       path: '/search',
//       builder: (context, state) {
//         return ChangeNotifierProvider<SearchViewModel>(
//           create: (context) => SearchViewModel(),
//           child: const SearchScreen(),
//         );
//       }),
// ]);
