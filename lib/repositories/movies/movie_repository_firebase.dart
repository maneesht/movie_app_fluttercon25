import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';

import '../../services/firebase/firebase_data_service.dart';

class MovieRepositoryFirebase implements MovieRepository {
  MovieRepositoryFirebase({required FirebaseDataService firebaseDataService})
      : _firebaseDataService = firebaseDataService;
  final FirebaseDataService _firebaseDataService;
  @override
  Future<Movie> getMovie(String id) {
    return _firebaseDataService.getMovie(id);
  }

  @override
  Future<List<Movie>> getMostRecentMovies() {
    return _firebaseDataService.getMostRecentMovies();
  }

  @override
  Future<List<Movie>> getTopTenMovies() {
    return _firebaseDataService.getTopTenMovies();
  }

  @override
  Future<List<Movie>> getAllMovies() {
    return _firebaseDataService.getAllMovies();
  }

  @override
  Future<bool> addMovieWatched(String id) {
    return _firebaseDataService.addWatched(id);
  }

  @override
  Future<bool> removeMovieWatched(String id) {
    return _firebaseDataService.removeWatched(id);
  }

  @override
  Future<bool> isWatched(String id) {
    return _firebaseDataService.isWatched(id);
  }
}
