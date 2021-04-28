import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/Book.dart';
import 'BookRoutePath.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.length >= 2) {
      if (uri.pathSegments[0] == 'book') {
        var remaining = uri.pathSegments[1];
        final mappedData = jsonDecode(remaining);
        return BooksDetailsPath(Book.fromJson(mappedData));
      }
    }
    return BooksListPath();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath configuration) {
    if (configuration is BooksListPath) {
      return RouteInformation(location: '/');
    }
    if (configuration is BooksDetailsPath) {
      return RouteInformation(
          location: '/book/${jsonEncode(configuration.book)}');
    }
    return null;
  }
}
