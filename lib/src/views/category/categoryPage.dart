import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/core/config/routes.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  final PageController? controller;
  const CategoryPage({Key? key, this.controller}) : super(key: key);


  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Widget _categoryCard(String text, String type, String imgPath) {
    return InkWell(
        onTap: () {
          context.push(AppRoutes.homeRoute, extra: type);
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                    // height:50,
                    color: Theme.of(context).primaryColor,
                    child: customImage(imgPath, fit: BoxFit.cover))),
            Text(text,
                style: AppTheme.h2Style
                    .copyWith(color: Theme.of(context).colorScheme.onSurface))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          title: Text(
            'News Category',
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).disabledColor,
                ),
                onPressed: () {})
          ],
          // bottom:PreferredSize(child:  Divider(height: 0,), preferredSize: Size(10,0))
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            padding: EdgeInsets.symmetric(vertical: 20),
            childAspectRatio: .8,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0,
            crossAxisCount: 3,
            children: <Widget>[
              _categoryCard('Tech', 'technology',
                  'https://images.unsplash.com/photo-1648737964965-7eda17871196?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D'),
              //  _categoryCard('Fashion','https://thumbs.dreamstime.com/b/abstract-woman-portrait-fashion-background-hand-painted-art-illustration-56110086.jpg'),
              _categoryCard('Economy', 'business',
                  'https://images.unsplash.com/photo-1589666564459-93cdd3ab856a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZWNvbm9taWN8ZW58MHx8MHx8fDA%3D'),
              _categoryCard('Sport', 'sports',
                  'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?ixlib=rb-1.2.1&w=1000&q=80'),
              _categoryCard('Health', 'health',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaCep4PcqSpssotFl08L8j9TNlE0WrYZdP_Ej6BjW-RXArQoFO'),
              _categoryCard('Fun', 'entertainment',
                  'https://plus.unsplash.com/premium_photo-1664882424754-ee3aeaa915cf?q=80&w=776&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              _categoryCard('Science', 'science',
                  'https://c.wallhere.com/photos/34/7f/nature_photography_portrait_display-36961.jpg!d'),
              _categoryCard('General', 'general',
                  'https://66.media.tumblr.com/3e368d4f495ab3e07b0c7114955b48dc/tumblr_mz8od094wc1rtp2uuo1_500.jpg'),
              _categoryCard('Music', '',
                  'https://i.pinimg.com/originals/06/c6/b5/06c6b57d26549b1ebdab20926a9e9e1e.jpg'),
              _categoryCard('Arts', '',
                  'https://vistapointe.net/images/fan-art-wallpaper-2.jpg'),
            ],
          ),
        ));
  }
}
