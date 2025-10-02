import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/core/config/routes.dart';
import 'package:news_app/src/models/article_model.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/view_models/new_view_model.dart';
import 'widget/newsCard.dart';

class HomePage extends ConsumerWidget {
  final String? type;

  const HomePage({Key? key, this.type}) : super(key: key);

  /// Header news (big featured news)
  Widget _headerNews(Article article) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            context.push(AppRoutes.NewsDetailPageRoute, extra: article);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Hero(
                tag: 'headerImage',
                child: article.urlToImage == null
                    ? Container()
                    : customImage(article.urlToImage ?? ''),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, bottom: 20, top: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title ?? '',
                      style: AppTheme.h4Style.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      article.getTime(),
                      style: AppTheme.subTitleStyle.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Body with SliverAppBar + News List
  Widget _body(BuildContext context, List<Article> list, {String? type}) {
    final safeType = (type ?? "General").toUpperCase();

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            "$safeType NEWS",
            style: AppTheme.h2Style.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          pinned: true,
        ),
        SliverToBoxAdapter(child: _headerNews(list.first)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewsCard(
              artical: list[index],
              type: safeType,
            ),
            childCount: list.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set system UI colors
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        statusBarColor: Theme.of(context).colorScheme.surface,
      ),
    );

    final category = type ?? "general"; // default if null
    final newsViewModel = ref.watch(newsViewModelProvider(category));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: newsViewModel.when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return const Center(child: Text('No content available'));
            } else {
              return _body(context, data, type: type);
            }
          },
          error: (error, stack) =>
              const Center(child: Text('Something went wrong')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
