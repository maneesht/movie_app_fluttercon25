import '../../model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTopTenMovies();
  Future<List<Movie>> getMostRecentMovies();
  Future<List<Movie>> getAllMovies();
  Future<bool> toggleMovieWatched(String id);
  Future<Movie> getMovie(String id);
  Future<bool> isWatched(String id);
}
