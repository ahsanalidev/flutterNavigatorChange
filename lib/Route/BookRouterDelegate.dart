import 'package:flutter/material.dart';

import '../Data/Books.dart';
import '../Extension/NoAnimationTransitionDelegate.dart';
import '../Model/Book.dart';
import '../Page/BookDetailsPage.dart';
import '../Page/BooksListPage.dart';
import 'BookRoutePath.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Book _selectedBook;

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  BookRoutePath get currentConfiguration {
    if (_selectedBook == null) {
      return BooksListPath();
    } else {
      return BooksDetailsPath(_selectedBook);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      transitionDelegate: NoAnimationTransitionDelegate(),
      pages: [
        BooksListPage(handleBookTapped: _handleBookTapped),
        if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedBook = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path is BooksDetailsPath) {
      _selectedBook = path.book;
    }
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}
