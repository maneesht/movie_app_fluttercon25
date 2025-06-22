import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/model/movie_json.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';

class MovieRepositoryFirebase implements MovieRepository {
  MovieRepositoryFirebase({required FirebaseDataService firebaseDataService})
      : _firebaseDataService = firebaseDataService;
  final FirebaseDataService _firebaseDataService;
  @override
  Future<Movie> getMovie(String id) {
    return _firebaseDataService.getMovie(id);
  }

  @override
  Future<MovieJson> getMovies() {
    return _firebaseDataService.getMovies();
  }
}
