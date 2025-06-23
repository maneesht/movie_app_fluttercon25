class Movie {
  String title;
  String id;
  String genre;
  String imageUrl;
  String description;
  int releaseYear;
  double rating;
  bool watched;
  Movie(
      {required this.title,
      required this.genre,
      required this.imageUrl,
      required this.id,
      required this.description,
      required this.rating,
      required this.releaseYear,
      this.watched = false});

  static Movie fromJson(e) {
    return Movie(
        title: e['title'],
        genre: e['genre'],
        imageUrl: e['imageUrl'],
        id: e['id'],
        description: e['description'],
        rating: e['rating'],
        releaseYear: e['releaseYear'],
        watched: e['watched'] ?? false);
  }
}
