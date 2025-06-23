import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail(
      {super.key, required this.id, required this.movieRepository});

  final String id;

  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: movieRepository.getMovie(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(children: <Widget>[
              Image.network(snapshot.data!.imageUrl, fit: BoxFit.fitHeight),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(snapshot.data!.description),
              )
            ]);
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            print(snapshot.stackTrace);
          }
          return const CircularProgressIndicator();
        });
  }
}
