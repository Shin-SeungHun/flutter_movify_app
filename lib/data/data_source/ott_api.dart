import 'dart:convert';
import 'package:env_flutter/env_flutter.dart';
import 'package:flutter_movify/data/dto/ott_dto.dart';
import 'package:http/http.dart' as http;

class OttApi {
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

  getOttInfoResult({required num id}) async {
    final response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id/watch/providers?api_key=$_apiKey'));
    return Autogenerated.fromJson(jsonDecode(response.body));
  }
}
