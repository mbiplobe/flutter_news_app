import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/article_model.dart';
import 'package:flutter_news_app/src/views/category/categoryPage.dart';
import 'package:flutter_news_app/src/views/homePage/homePage.dart';
import 'package:flutter_news_app/src/views/newsApp.dart';
import 'package:flutter_news_app/src/views/newsDetail/newsDetailPage.dart';
import 'package:flutter_news_app/src/views/profile/profilePage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.NewsRoute, builder: (context, state) => NewsApp()),
    GoRoute(path: AppRoutes.homeRoute, builder: (context, state) => HomePage()),
    GoRoute(
      path: AppRoutes.ProfilePage,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: AppRoutes.CategoryPageRoute,
      builder: (context, state) => CategoryPage(),
    ),
    GoRoute(
      path: AppRoutes.NewsDetailPageRoute,
      builder: (context, state) {
        final article = state.extra as Article?;
        if (article == null) {
          // Handle missing extra gracefully
          return const Scaffold(
            body: Center(child: Text("No article data found")),
          );
        }
        return NewsDetailPage(article: article);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('${state.error}')));
  },
);

class AppRoutes {
  static const NewsRoute = "/";
  static const homeRoute = "/HomePage";
  static const NewsDetailPageRoute = "/NewsDetailPage";
  static const CategoryPageRoute = "/CategoryPage";
  static const ProfilePage = "/ProfilePage";
}