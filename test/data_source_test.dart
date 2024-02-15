import 'package:flutter_movify/data/data_source/movie_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movify/data/dto/movie_dto.dart';
void main(){
  test('api test', () async{

    final MovieApi api = MovieApi();
    await api.init();
    MovieDto dto = await api.getMovieInfoResult(1);

    expect(dto.results?.map((e) => e.id), isNotNull);
    return null;
  });
}