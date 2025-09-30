import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/models/article_model.dart';
import 'package:news_app/src/models/news_response_model.dart';
import 'package:http/http.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = dotenv.env['NEWS_API_KEY'];
  final _baseURL = dotenv.env['BASE_URL'];
    final _topHeadLine = dotenv.env['TOP_HEAD_LINE'];

  Future<List<Article>?> fetchNewsList({String category = ''}) async {
    var url ="${_baseURL}${_topHeadLine}?country=in&apiKey=$_apiKey&category=$category";
    // print("entered Url : $url");
    final response = await client.get(Uri.parse(url));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResonse.fromJson(response.body as Map<String, dynamic>).articles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
