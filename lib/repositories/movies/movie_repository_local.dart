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
  Future<MovieJson> getMovies() {
    return _localDataService.getMovies();
  }
}
