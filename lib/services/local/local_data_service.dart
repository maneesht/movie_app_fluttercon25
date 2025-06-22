import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class LocalDataService {
  List<Movie> _movies = [];

  Future<List<Movie>> getAllMovies() async {
    if (_movies.isEmpty) {
      String jsonString = await rootBundle.loadString('lib/static/movies.json');
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final List<Movie> moviesList =
          json['movies'].map((e) => Movie.fromJson(e)).toList();
      _movies = moviesList;
    }
    return _movies;
  }

  Future<List<Movie>> getTopTenMovies() async {
    List<Movie> unsortedMovies = (await getAllMovies());
    List<Movie> movies = List.from(unsortedMovies);
    movies.sort((movieA, movieB) => movieA.rating.compareTo(movieB.rating));
    return movies;
  }

  Future<List<Movie>> getMostRecentMovies() async {
    List<Movie> unsortedMovies = (await getAllMovies());
    List<Movie> movies = List.from(unsortedMovies);
    movies.sort(
        (movieA, movieB) => movieA.releaseYear.compareTo(movieB.releaseYear));
    return movies;
  }

  Future<Movie> getMovie(String id) async {
    List<Movie> movies = await getAllMovies();
    return movies.firstWhere((e) => e.id == id);
  }
}
