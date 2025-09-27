import 'package:flutter_news_app/src/data/repository/new_resopitory.dart';
import 'package:flutter_news_app/src/models/article_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsUsecases 
{
  NewsRepository newsRepository;

  NewsUsecases(this.newsRepository);

  Future<List<Article>?> fetchAllNews(String? category) {
    return newsRepository.fetchAllNews(category);
  }



  

}

 final newsUsecasesProvider = Provider<NewsUsecases>((ref) {
  final api = ref.watch(newsRepositoryProvider);
  return NewsUsecases(api);
});
