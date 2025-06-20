import 'package:movie_app_fluttercon25/model/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Serializer {
  static Future<MovieJson> serialize() async {
    String jsonString = await rootBundle.loadString('lib/static/movies.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    print(json['featured']);
    final List<dynamic> moviesList = json['featured']['movies'];
    final List<dynamic> newReleasesList = json['newReleases']['movies'];
    final List<Movie> featured =
        moviesList.map((e) => Movie.fromJson(e)).toList();
    final List<Movie> newReleases =
        newReleasesList.map((e) => Movie.fromJson(e)).toList();
    return MovieJson(featured: featured, newReleases: newReleases);
  }
}

class MovieJson {
  List<Movie> featured;
  List<Movie> newReleases;
  MovieJson({required this.featured, required this.newReleases});
}
