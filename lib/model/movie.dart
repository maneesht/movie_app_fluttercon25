class Movie {
  String title;
  String id;
  String genre;
  String imageUrl;
  String description;
  Movie(
      {required this.title,
      required this.genre,
      required this.imageUrl,
      required this.id,
      required this.description});

  static Movie fromJson(e) {
    return Movie(
        title: e['title'],
        genre: e['genre'],
        imageUrl: e['imageUrl'],
        id: e['id'],
        description: e['description']);
  }
}
