import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/search/search_view_model.dart';
import 'package:flutter_movify/ui/search/widget/movie_list_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(builder: (BuildContext context, SearchViewModel viewModel, Widget? child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: SearchBar(
                      controller: _textEditingController,
                      onChanged: (query) {
                        viewModel.searchImage(query);
                      },
                      hintText: '검색할 영화제목을 입력하세요',
                      leading: const Icon(Icons.search),
                      autoFocus: true,
                      textInputAction: TextInputAction.done,
                      trailing: [
                        Visibility(
                          visible: _textEditingController.text.isNotEmpty,
                          child: GestureDetector(
                              onTap: () {
                                _textEditingController.clear();
                                setState(() {});
                              },
                              child: const Icon(Icons.clear)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              const BackgroundWidget(),
              ListView.builder(
                itemCount: viewModel.movieItemList.length,
                itemBuilder: (context, index) {
                  MovieItem movieItem = viewModel.movieItemList[index];
                  return GestureDetector(
                      onTap: () {
                        context.push('/movieInfo', extra: movieItem);
                      },
                      child: MovieListItem(movieItem: movieItem));
                },
              ),
            ],
          ));
    });
  }
}
