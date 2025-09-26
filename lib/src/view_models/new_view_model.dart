import 'dart:async';

import 'package:flutter_news_app/src/domain/usecases/news_usecases.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewViewModel extends AsyncNotifier<List<Article>?>
{
  @override
  FutureOr<List<Article>?> build() async{
    final newsUsecases = ref.read(newsUsecasesProvider);
    return newsUsecases.fetchAllNews();
  }

   Future<void> refresh() async {
    state = const AsyncLoading();
    final usecases = ref.watch(newsUsecasesProvider);
    state = await AsyncValue.guard(() => usecases.fetchAllNews());
  }

}

final newViewModelProvider = AsyncNotifierProvider<NewViewModel, List<Article>?>(NewViewModel.new);