import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/views/VideoNews/videoNewsPage.dart';
import 'package:flutter_news_app/src/views/category/categoryPage.dart';
import 'package:flutter_news_app/src/views/homePage/homePage.dart';
import 'package:flutter_news_app/src/views/profile/profilePage.dart';

class WidgetUtils {
  static final List<Widget> pages = [
    HomePage(),
    VideoNewsPage(),
    CategoryPage(),
    ProfilePage(),
  ];
}
