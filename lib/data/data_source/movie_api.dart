import 'dart:convert';

import 'package:flutter_movify/data/dto/movie_dto.dart';
import 'package:http/http.dart' as http;
import 'package:env_flutter/env_flutter.dart';

class MovieApi {
  String? _apiKey;

  /// API 초기화
  init() async {
    try {
      await dotenv.load();
      _apiKey = dotenv.env['API_KEY']!;
    } catch (e) {
      print('Failed to load API key: $e');
    }
  }

  getMovieInfoResult(int page) async {
    final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=ko-KR&page=$page'));
    return MovieDto.fromJson(jsonDecode(response.body));
  }
}
