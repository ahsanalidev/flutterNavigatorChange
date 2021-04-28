// Routes
import '../Model/Book.dart';

abstract class BookRoutePath {}

class BooksListPath extends BookRoutePath {}

class BooksDetailsPath extends BookRoutePath {
  final Book book;

  BooksDetailsPath(
    this.book,
  );
}
