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
          ),
          body: Stack(
            children: [
              const BackgroundWidget(),
              RefreshIndicator(
                onRefresh: () async {
                  viewModel.movieItemList;
                },
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.movieItemList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 1 개의 행에 보여줄 item 개수
                    childAspectRatio: 0.7, // item 의 가로 세로의 비율
                    mainAxisSpacing: 0, // 수평 Padding
                    crossAxisSpacing: 0, // 수직 Padding
                  ),
                  itemBuilder: (context, index) {
                    final MovieItem movieItem = viewModel.movieItemList[index];
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ImageWidget(movieItem: movieItem),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
