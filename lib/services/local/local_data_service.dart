import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/services.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class LocalDataService {
  List<Movie> _movies = [];
  Map<String, bool> _watched = {};

  Future<List<Movie>> getAllMovies() async {
    if (_movies.isEmpty) {
      String jsonString = await rootBundle.loadString('lib/static/movies.json');
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final moviesList = (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList();
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

  Future<bool> isWatched(String id) async {
    return _watched[id] ?? false;
  }

  Future<bool> toggleWatched(String id) async {
    _watched[id] = !(await isWatched(id));
    return _watched[id]!;
  }

  Future<void> addUser(User user) async {
    // dummy user add
  }
}
