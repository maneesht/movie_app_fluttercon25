import '../../model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTopTenMovies();
  Future<List<Movie>> getMostRecentMovies();
  Future<List<Movie>> getAllMovies();
  Future<Movie> toggleMovieWatched(String id);
  Future<Movie> getMovie(String id);
}
