import 'package:flutter/material.dart';
import 'package:flutter_movify/router/app_router.dart';

void main() {
  /// 라우터 초기화
  AppRouter.instance;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Movie Finder',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.indigo),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
