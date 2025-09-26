import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/core/widget_utils.dart';
import 'package:flutter_news_app/src/view_models/bottom_navigation_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationWidget extends ConsumerWidget {
final PageController controller;

   BottomNavigationWidget({super.key, required this.controller});
  final List<Widget> _pages = WidgetUtils.pages;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final navVM = ref.read(bottomNavProvider.notifier);

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        fixedColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).disabledColor,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (pageIndex) {
          navVM.setIndex(pageIndex);

          controller.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        },
      ),
    );
  }
}


//  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.play_circle_outline), label: 'Video'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.category), label: 'Category'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person), label: 'Profile'),

