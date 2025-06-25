import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class FirebaseDataService {
  Future<void> addUser(User user) async {
    throw UnimplementedError();
  }

  Future<List<Movie>> getMostRecentMovies() async {
    return [];
  }

  Future<List<Movie>> getTopTenMovies() async {
    return [];
  }

  Future<List<Movie>> getAllMovies() async {
    return [];
  }

  Future<bool> addWatched(String id) async {
    return true;
  }

  Future<bool> removeWatched(String id) async {
    return true;
  }

  Future<bool> isWatched(String id) async {
    return false;
  }

  Future<Movie> getMovie(String id) async {
    throw UnimplementedError();
  }
}
