import 'package:flutter_movify/data/data_source/credits_api.dart';
import 'package:flutter_movify/data/dto/credits_dto.dart';
import 'package:flutter_movify/data/mapper/cast_mapper.dart';
import 'package:flutter_movify/data/model/cast_item.dart';
import 'package:flutter_movify/data/repository/credits_repository.dart';

class CreditsRepositoryImpl implements CreditsRepository {
  final CreditsApi _api = CreditsApi();

  @override
  Future<List<CastItem>> getCastItems({required int id}) async {
    await _api.init();
    final CreditsDto dto = await _api.getCreditsInfoResult(id: id);
    return dto.cast!.map((e) => e.toCastItem()).toList();
  }
}
