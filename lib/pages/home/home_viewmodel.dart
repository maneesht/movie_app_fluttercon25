import 'package:flutter/foundation.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.movieRepository});
  final MovieRepository movieRepository;
  void toggleWatched(String movieId) async {
    await movieRepository.toggleMovieWatched(movieId);
    notifyListeners();
  }
}
