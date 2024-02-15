import 'package:flutter_movify/ui/home/home_screen.dart';
import 'package:flutter_movify/ui/home/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// class Routes {}

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
          child: HomeScreen(),
        );
      }),
]);
