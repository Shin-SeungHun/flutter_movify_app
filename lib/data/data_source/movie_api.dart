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

  getMovieInfoResult({required String query, required int page}) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/$query?api_key=$_apiKey&language=ko-KR&page=$page&region=KR'));
    return MovieDto.fromJson(jsonDecode(response.body));
  }

  searchMovieInfoResult({required String query}) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$query&language=ko-KR&page=1'));
    return MovieDto.fromJson(jsonDecode(response.body));
  }

  getOttMovieInfoResult({required int page, required int watchProvider}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&language=ko-KR&page=$page&sort_by=popularity.desc&watch_region=KR&with_watch_providers=$watchProvider'));
    return MovieDto.fromJson(jsonDecode(response.body));
  }

  getGenreMovieInfoResult({required int page, required int genre}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&language=ko-KR&page=$page&region=KR&sort_by=popularity.desc&with_genres=$genre'));
    return MovieDto.fromJson(jsonDecode(response.body));
  }


}
