import 'package:movie_app_fluttercon25/model/movie_json.dart';

import '../../model/movie.dart';

abstract class MovieRepository {
  Future<MovieJson> getMovies();
  Future<Movie> getMovie(String id);
}
