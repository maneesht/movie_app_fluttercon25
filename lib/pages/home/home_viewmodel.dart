import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';

class HomeViewModel {
  HomeViewModel({required this.movieRepository});
  final MovieRepository movieRepository;
}
