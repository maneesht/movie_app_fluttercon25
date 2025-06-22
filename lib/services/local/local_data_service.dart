import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/model/movie_json.dart';

class LocalDataService {
  MovieJson _movies = MovieJson(featured: [], newReleases: []);

  Future<MovieJson> getMovies() async {
    if (_movies.featured.isEmpty) {
      String jsonString = await rootBundle.loadString('lib/static/movies.json');
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final List<dynamic> moviesList = json['featured']['movies'];
      final List<dynamic> newReleasesList = json['newReleases']['movies'];
      final List<Movie> featured =
          moviesList.map((e) => Movie.fromJson(e)).toList();
      final List<Movie> newReleases =
          newReleasesList.map((e) => Movie.fromJson(e)).toList();
      _movies = MovieJson(featured: featured, newReleases: newReleases);
    }
    return _movies;
  }

  Future<Movie> getMovie(String id) async {
    MovieJson movies = await getMovies();
    try {
      Movie? featuredFind = movies.featured.firstWhere((e) => e.id == id);
      return featuredFind;
    } catch (e) {
      // ignore error
    }
    Movie? newReleasesFind = movies.newReleases.firstWhere((e) => e.id == id);
    return newReleasesFind;
  }
}
