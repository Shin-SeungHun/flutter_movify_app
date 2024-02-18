import 'package:flutter_movify/data/dto/ott_dto.dart';
import 'package:flutter_movify/data/model/ott_item.dart';

extension DtoToModel on Flatrate {
  OttItem toOttItem() {
    return OttItem(
        logoPath: logoPath ?? '',
        providerId: providerId ?? 0,
        providerName: providerName ?? '',
        displayPriority: displayPriority ?? 0);
  }
}
