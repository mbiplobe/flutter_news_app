import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/core/config/routes.dart';
import 'package:news_app/src/models/article_model.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/view_models/new_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widget/newsCard.dart';

class HomePage extends ConsumerWidget {
  String? type;
  HomePage({super.key, this.type});

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
                      : customImage(article.urlToImage??''),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      // stops: [.1, .9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.title??'',
                          style: AppTheme.h4Style.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface)),
                      Text(
                        article.getTime(),
                        style: AppTheme.subTitleStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    required String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type.toUpperCase()} NEWS',
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).colorScheme.surface),
          ),
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _headerNews(list.first),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      type: type.toUpperCase()
                    ),
                childCount: list.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        statusBarColor: Theme.of(context).colorScheme.surface,)); 
    

final newsViewModel=  ref.watch(newsViewModelProvider(type));
     
  
     
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: newsViewModel.when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return Text('No content avilable');
            } else {
              return _body(context, data, type: 'More...');
            }
          },
          error: (error, stack) => Center(child: Text('Something went wrong')),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
