class Book {
  final String title;
  final String author;
  final String url;

  Book(this.title, this.author, this.url);
  Map<String, String> toJson() => {
        'title': title,
        'author': author,
        'url': url,
      };

  factory Book.fromJson(Map<String, String> json) =>
      Book(json['title'], json['author'], json['url']);
}
