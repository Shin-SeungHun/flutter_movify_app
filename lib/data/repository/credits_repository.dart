import 'package:flutter_movify/data/model/cast_item.dart';

abstract interface class CreditsRepository {
  Future<List<CastItem>> getCastItems({required num id});
}
