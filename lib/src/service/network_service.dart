import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:painteres_clone/src/model/pinterest_model.dart';

class HttpService {
  Future<List<PinterestModel>> gelAllImages() async {
    String apiKey = "_b7G5MSmbx76SSPRWqaXPPKocMjW2Tq4MYPvvX7d1gk";
    String baseUrl = "https://api.unsplash.com/photos/?client_id=$apiKey";
    Uri uri = Uri.parse(baseUrl);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      final data = jsonDecode(json) as List;
      return data.map((e) => PinterestModel.fromJson(e)).toList();
    } else {
      throw Exception("error http service");
    }
  }

  Future<List<PinterestModel>> pagination(int page) async {
    String apiKey = "_b7G5MSmbx76SSPRWqaXPPKocMjW2Tq4MYPvvX7d1gkb";
    String baseUrl =
        "https://api.unsplash.com/photos/?client_id=$apiKey";
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json) as List;
      return data.map((e) => PinterestModel.fromJson(e)).toList();
    } else {
      throw Exception("error http pagination");
    }
  }
}
