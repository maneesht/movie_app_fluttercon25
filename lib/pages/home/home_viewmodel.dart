import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.movieRepository, required this.authRepository});
  final MovieRepository movieRepository;
  final AuthRepository authRepository;
  void toggleWatched(String movieId, bool isWatched) async {
    if (isWatched) {
      await movieRepository.removeMovieWatched(movieId);
    } else {
      await movieRepository.addMovieWatched(movieId);
    }
    notifyListeners();
  }

  Future<bool> isWatched(String movieId) async {
    return movieRepository.isWatched(movieId);
  }

  Future<void> signOut() async {
    await authRepository.logOut();
  }
}
