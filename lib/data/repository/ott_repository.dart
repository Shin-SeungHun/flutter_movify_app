import 'package:flutter_movify/data/model/ott_item.dart';

abstract interface class OttRepository {
  Future<List<OttItem>> getOttItems({required num id});
}
