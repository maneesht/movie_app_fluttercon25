import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class FirebaseDataService {
  Future<List<Movie>> getMostRecentMovies() async {
    throw UnimplementedError();
  }

  Future<Movie> getMovie(String id) async {
    throw UnimplementedError();
  }

  Future<List<Movie>> getTopTenMovies() async {
    throw UnimplementedError();
  }

  Future<List<Movie>> getAllMovies() async {
    throw UnimplementedError();
  }

  Future<Movie> toggleMovieWatched(String id) async {
    throw UnimplementedError();
  }

  Future<void> addUser(User user) async {
    throw UnimplementedError();
  }
}
