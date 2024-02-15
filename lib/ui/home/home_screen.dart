import 'package:flutter/material.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Finder'),
      ),
      body: Stack(
        children: [
          BackgroundWidget(),
        ],
      ),
    );
  }
}
