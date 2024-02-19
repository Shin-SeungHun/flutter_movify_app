import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/cast_item.dart';
import 'package:flutter_movify/data/model/movie_item.dart';
import 'package:flutter_movify/data/model/ott_item.dart';
import 'package:flutter_movify/data/repository/credits_repository_impl.dart';
import 'package:flutter_movify/data/repository/ott_repository_impl.dart';

class MovieInfoViewModel extends ChangeNotifier {
  final MovieItem movieItem;
  final CreditsRepositoryImpl _creditsRepository = CreditsRepositoryImpl();
  final OttRepositoryImpl _ottRepository = OttRepositoryImpl();
  List<CastItem> _castList = [];
  List<OttItem> _ottList = [];

  List<CastItem> get castList => _castList;

  List<OttItem> get ottList => _ottList;

  MovieInfoViewModel({
    required this.movieItem,
  }) {
    fetchCastInfo(id: movieItem.id);
    fetchOttInfo(id: movieItem.id);
  }

  /// 출연진 리스트
  fetchCastInfo({required num id}) async {
    _castList = await _creditsRepository.getCastItems(id: id);
    notifyListeners();
  }

  /// ott 리스트
  fetchOttInfo({required num id}) async {
    _ottList = await _ottRepository.getOttItems(id: id);
    notifyListeners();
  }
}
