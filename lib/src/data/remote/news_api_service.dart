import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  final _apiKey = dotenv.env['NEWS_API_KEY'];
  final _baseURL = dotenv.env['BASE_URL'];
  final _topHeadLine = dotenv.env['TOP_HEAD_LINE'];

  Future<List<Article>?> fetchAllNews({String category = ''}) async {
    try {
      final url = Uri.parse(
        "${_baseURL}${_topHeadLine}?country=in&apiKey=$_apiKey&category=$category",
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsApiResonse.fromRawJson(response.body).articles;
      } else {
        throw Exception('Failed to load post');
        // return null;
      }
    } on Exception catch (e) {
      print(e);
       throw Exception('Failed to load data, ' + e.toString());
    }
  }
}

final newsApiServiceProvider = Provider<NewsApiService>((ref) {
  return NewsApiService();
});
