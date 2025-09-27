import 'package:flutter_news_app/src/data/remote/news_api_service.dart';
import 'package:flutter_news_app/src/models/article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewRespositoryImp implements NewsRepository {
  NewsApiService apiService;
  NewRespositoryImp(this.apiService);
  
  @override
  Future<List<Article>?> fetchAllNews({String category = ''}) {
    return apiService.fetchAllNews(category: category);
  }
}

abstract class NewsRepository {
  Future<List<Article>?> fetchAllNews({String category = ''});
}

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final api = ref.watch(newsApiServiceProvider);
  return NewRespositoryImp(api);
});
