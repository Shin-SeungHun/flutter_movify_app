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
          GridView.builder(
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
              childAspectRatio: 0.7, //item 의 가로 세로의 비율
              mainAxisSpacing: 0, //수평 Padding
              crossAxisSpacing: 0, //수직 Padding
            ),
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      'https://i.namu.wiki/i/tsdkwuhPrYqpG4ovQ69SUEWqbWc9w0_3UjbB81cNGeBLcl-w4vi8IWcUYFLMb32IcddF2qZ1exIgEfzUouT6iUoe6dDwhcViEeIYKJPkzTlhdTibXdoisaH7YphZWlAGozbcFX2yG8d4_efNMNzL8g.webp',
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
