import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/model/movie_json.dart';
import 'package:movie_app_fluttercon25/services/local/local_data_service.dart';

import 'movie_repository.dart';

class MovieRepositoryLocal implements MovieRepository {
  MovieRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Movie> getMovie(String id) {
    return _localDataService.getMovie(id);
  }

  @override
  Future<List<Movie>> getAllMovies() {
    return _localDataService.getAllMovies();
  }

  @override
  Future<List<Movie>> getTopTenMovies() {
    return _localDataService.getTopTenMovies();
  }

  @override
  Future<List<Movie>> getMostRecentMovies() {
    return _localDataService.getMostRecentMovies();
  }

  @override
  Future<bool> addMovieWatched(String id) {
    return _localDataService.addWatched(id);
  }

  @override
  Future<bool> removeMovieWatched(String id) {
    return _localDataService.removeWatched(id);
  }

  @override
  Future<bool> isWatched(String id) {
    return _localDataService.isWatched(id);
  }
}
