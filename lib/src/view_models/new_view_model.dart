import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_news_app/src/domain/usecases/news_usecases.dart';
import 'package:flutter_news_app/src/models/article_model.dart';
import 'package:flutter_riverpod/legacy.dart';

// -----------------------------
// StateNotifier to hold AsyncValue
// -----------------------------
class NewsViewModel extends StateNotifier<AsyncValue<List<Article>?>> {
  final NewsUsecases newsUsecases;
  final String? category;

  NewsViewModel({required this.newsUsecases, this.category})
      : super(const AsyncValue.loading()) {
    // Initial fetch
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    state = const AsyncValue.loading();
    try {
      final articles = await newsUsecases.fetchAllNews(category);
      state = AsyncValue.data(articles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchArticles();
  }
}

// -----------------------------
// Provider for the ViewModel
// -----------------------------
final newsViewModelProvider = StateNotifierProvider.family<
    NewsViewModel, AsyncValue<List<Article>?>, String?>(
  (ref, category) {
    final usecases = ref.read(newsUsecasesProvider);
    return NewsViewModel(newsUsecases: usecases, category: category);
  },
);
