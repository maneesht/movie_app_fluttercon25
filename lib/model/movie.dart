class Movie {
  String title;
  String genre;
  String imageUrl;
  Movie({required this.title, required this.genre, required this.imageUrl});

  static Movie fromJson(e) {
    return Movie(title: e['title'], genre: e['genre'], imageUrl: e['imageUrl']);
  }
}
