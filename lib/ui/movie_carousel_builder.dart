import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/pages/home/home_viewmodel.dart';

import '../model/movie.dart';
import '../widgets/movie_carousel.dart';

class MovieCarouselBuilder extends StatelessWidget {
  const MovieCarouselBuilder(
      {super.key,
      required this.title,
      required this.future,
      required this.model});

  final Future<List<Movie>> future;
  final String title;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.stackTrace);
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return MovieCarousel(
              movies: snapshot.data!,
              title: title,
              model: model,
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
