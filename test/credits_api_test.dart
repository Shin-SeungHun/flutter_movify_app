import 'package:flutter_movify/data/data_source/credits_api.dart';
import 'package:flutter_movify/data/dto/credits_dto.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  test('api test', () async{

    final CreditsApi api = CreditsApi();
    await api.init();
    CreditsDto dto = await api.getCreditsInfoResult(id: 933131);

    expect(dto.cast?.map((e) => e.id), isNotNull);
    return null;
  });
}