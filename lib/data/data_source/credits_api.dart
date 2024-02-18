import 'dart:convert';

import 'package:env_flutter/env_flutter.dart';
import 'package:flutter_movify/data/dto/credits_dto.dart';
import 'package:http/http.dart' as http;

class CreditsApi{
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

  getCreditsInfoResult({required int id}) async {
    final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/movie/$id/credits?api_key=$_apiKey&language=ko-KR'));
    return CreditsDto.fromJson(jsonDecode(response.body));
  }
}