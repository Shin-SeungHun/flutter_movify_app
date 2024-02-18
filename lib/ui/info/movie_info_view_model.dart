import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/cast_item.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/repository/credits_repository_impl.dart';

class MovieInfoViewModel extends ChangeNotifier {
  final MovieItem movieItem;
  final CreditsRepositoryImpl _repository = CreditsRepositoryImpl();
  List<CastItem> castList = [];

  MovieInfoViewModel({
    required this.movieItem,
  }) {
    fetchCastInfo(id: movieItem.id);
  }

  fetchCastInfo({required num id}) async {
    castList = await _repository.getCastItems(id: id);
    notifyListeners();
  }
}
