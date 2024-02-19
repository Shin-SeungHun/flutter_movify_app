import 'package:flutter_movify/data/data_source/ott_api.dart';
import 'package:flutter_movify/data/dto/ott_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('api test', () async {
    final OttApi api = OttApi();
    await api.init();
    Autogenerated dto = await api.getOttInfoResult(id: 933131);

    expect(dto.results?.kR?.flatrate?.map((e) => e.providerId), isNotNull);
    return null;
  });
}
