import 'package:flutter/material.dart';

import '../Model/Book.dart';

class BooksListScreen extends StatelessWidget {
  final ValueChanged<Book> onTapped;

  final List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein',
        'https://picsum.photos/id/237/200/300'),
    Book('Foundation', 'Isaac Asimov', 'https://picsum.photos/id/237/200/300'),
    Book(
      'Fahrenheit 451',
      'Ray Bradbury',
      'https://picsum.photos/id/237/200/300',
    ),
  ];

  BooksListScreen({
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}
