import 'package:movie_app_fluttercon25/model/movie.dart';

class MovieJson {
  List<Movie> featured;
  List<Movie> newReleases;
  MovieJson({required this.featured, required this.newReleases});
}
