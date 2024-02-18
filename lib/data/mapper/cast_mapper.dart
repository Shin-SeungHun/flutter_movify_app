import 'package:flutter_movify/data/dto/credits_dto.dart';
import 'package:flutter_movify/data/model/cast_item.dart';

extension DtoToModel on Cast {
  CastItem toCastItem() {
    return CastItem(
        adult: adult ?? false,
        gender: gender ?? 0,
        id: id ?? 0,
        knownForDepartment: knownForDepartment ?? '',
        name: name ?? '',
        originalName: originalName ?? '',
        popularity: popularity ?? 0,
        profilePath: profilePath ?? '',
        castId: castId ?? 0,
        character: character ?? '',
        creditId: creditId ?? '',
        order: order ?? 0);
  }
}
