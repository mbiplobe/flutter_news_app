import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';

import 'VideoNews/videoNewsPage.dart';
import 'category/categoryPage.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller, key: Key('Bottom widget'),),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          VideoNewsPage(),
          CategoryPage(
            controller: _controller, key: null,
          ),
          ProfilePage(),
        ],
      ),
    );
  }
}
