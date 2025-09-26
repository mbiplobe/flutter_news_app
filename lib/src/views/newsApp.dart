import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottom_navigation_widget.dart';
import 'package:flutter_news_app/src/core/widget_utils.dart';
import 'package:flutter_news_app/src/view_models/bottom_navigation_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class NewsApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends ConsumerState<NewsApp> {
  late final PageController _controller;
final List<Widget> _pages = WidgetUtils.pages;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    _controller.addListener(() {
    final pageIndex = _controller.page?.round() ?? 0;

      if (pageIndex != ref.read(bottomNavProvider)) {
        ref.read(bottomNavProvider.notifier).setIndex(pageIndex);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        children: _pages,
      ),
    );
  }
}
