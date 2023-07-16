import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    html.document.title = capitalize(_pages[getPageIndex(routeName)]);

    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.document.title = capitalize(_pages[pageIndex]);
        html.window.history
            .pushState(null, _pages[pageIndex], '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
      }
    });
  }

  int getPageIndex(String routeName) =>
      !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
