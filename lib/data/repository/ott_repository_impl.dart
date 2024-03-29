import 'package:flutter_movify/data/data_source/ott_api.dart';
import 'package:flutter_movify/data/dto/ott_dto.dart';
import 'package:flutter_movify/data/mapper/ott_mapper.dart';
import 'package:flutter_movify/data/model/ott_item.dart';
import 'package:flutter_movify/data/repository/ott_repository.dart';

class OttRepositoryImpl implements OttRepository {
  final OttApi _api = OttApi();

  @override
  Future<List<OttItem>> getOttItems({required num id}) async {
    await _api.init();
    final Autogenerated dto = await _api.getOttInfoResult(id: id);
    if (dto.results == null || dto.results!.kR == null || dto.results!.kR!.flatrate == null) {
      // dto.results 또는 kR 또는 flatrate가 null인 경우 빈 리스트 반환
      return [];
    } else {
      // flatrate가 null이 아닌 경우 OttItem으로 매핑하여 반환
      return dto.results!.kR!.flatrate!.map((e) => e.toOttItem()).toList();
    }
  }
}
