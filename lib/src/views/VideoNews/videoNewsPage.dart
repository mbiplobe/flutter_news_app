import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/core/config/routes.dart';
import 'package:news_app/src/models/article_model.dart';
import 'package:news_app/src/view_models/new_view_model.dart';
import 'package:news_app/src/views/homePage/widget/newsCard.dart';
import 'package:news_app/src/theme/theme.dart';

class VideoNewsPage extends ConsumerWidget {
  String? type;
  Widget _headerNews(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          // BlocProvider.of<DetailBloc>(context)
          //     .add(SelectNewsForDetail(article: article));
          // Navigator.pushNamed(context, '/detail');
          context.push(AppRoutes.NewsDetailPageRoute,extra: article);
        },
        child: Container(
            width: MediaQuery.of(context).size.width * 6,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    article.urlToImage == null
                        ? Container()
                        : customImage(article.urlToImage??'', fit: BoxFit.fitWidth),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(article.title??'',
                              style: AppTheme.h2Style.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                          Text(article.getTime(),
                              style: AppTheme.subTitleStyle.copyWith(
                                  color: Theme.of(context).disabledColor))
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: _playWidget(context),
                        ))
                  ],
                ))));
  }

  Widget _playWidget(BuildContext context) {
    return SizedBox(
        height: 25,
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).bottomAppBarTheme.color),
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).disabledColor,
                  size: 25,
                ))));
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    String? type ,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type!.toUpperCase()} NEWS',
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          pinned: true,
        ),
        SliverToBoxAdapter(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return _headerNews(context, list[index]);
                  },
                  itemCount: 5,
                ))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      isVideoNews: true,
                      type: type.toUpperCase(), key: null,
                    ),
                childCount: list.length)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsViewModel=  ref.watch(newsViewModelProvider(type));
    return Scaffold(
        backgroundColor: Theme.of(context).cardTheme.color,
        body: SafeArea(
           child: newsViewModel.when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return Text('No content avilable');
            } else {
              return _body(context, data, type: type ?? 'General');
            }
          },
          error: (error, stack) => Center(child: Text('Something went wrong')),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        ));
  }
}
