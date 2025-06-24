import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/dataconnect-generated/dart/default_connector/default.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class FirebaseDataService {
  Future<List<Movie>> getMostRecentMovies() async {
    return DefaultConnector.instance.top10mostRecent().execute().then((res) {
      return res.data.movies
          .map((e) => Movie(
              description: e.description,
              genre: e.genre,
              id: e.id,
              imageUrl: e.imageUrl,
              releaseYear: e.releaseYear,
              rating: e.rating,
              title: e.title))
          .toList();
    });
  }

  Future<Movie> getMovie(String id) async {
    throw UnimplementedError();
  }

  Future<List<Movie>> getTopTenMovies() async {
    return DefaultConnector.instance
        .getTop10moviesWithWatchStatus()
        .execute()
        .then((res) {
      return res.data.movies
          .map((e) => Movie(
              description: e.description,
              genre: e.genre,
              id: e.id,
              imageUrl: e.imageUrl,
              releaseYear: e.releaseYear,
              rating: e.rating,
              title: e.title))
          .toList();
    });
  }

  Future<List<Movie>> getAllMovies() async {
    return DefaultConnector.instance.listAllMovies().execute().then((res) {
      return res.data.movies
          .map((e) => Movie(
              description: e.description,
              genre: e.genre,
              id: e.id,
              imageUrl: e.imageUrl,
              releaseYear: e.releaseYear,
              rating: e.rating,
              title: e.title))
          .toList();
    });
  }

  Future<bool> addMovieWatched(String id) async {
    await DefaultConnector.instance.addWatched(movieId: id).execute();
    return true;
  }

  Future<bool> removeMovieWatched(String id) async {
    await DefaultConnector.instance.removeWatched(movieId: id).execute();
    return false;
  }

  Future<bool> isWatched(String id) async {
    final result =
        await DefaultConnector.instance.isMovieFavorited(id: id).execute();
    return result.data.watchedMovie?.movieId.isNotEmpty ?? false;
  }

  Future<void> addUser(User user) async {
    await DefaultConnector.instance
        .addUser(displayName: user.displayName!, email: user.email!)
        .execute();
  }
}
