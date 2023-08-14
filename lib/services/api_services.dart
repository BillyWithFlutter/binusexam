import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&apiKey=16ae0da329ae47e6a8af25552c0e5272";

  Future<List<Article>> getArticle() async {
    try {
      final response = await http.get(Uri.parse(endPointUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return (jsonData['articles'] as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
      } else {
        print('API request failed with status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }
}
