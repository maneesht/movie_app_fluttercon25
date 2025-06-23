import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/ui/movie_carousel_builder.dart';
import 'package:movie_app_fluttercon25/widgets/movie_carousel.dart';

import 'home_viewmodel.dart';

enum MovieSize { small, large }

class Home extends StatelessWidget {
  Home({super.key, required this.model});
  final HomeViewModel model;
  final List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Image.asset(
              "lib/static/reeltime_logo.png",
              width: 110,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
          ],
        ),
        ListenableBuilder(
            listenable: model,
            builder: (context, child) {
              return Column(children: [
                MovieCarouselBuilder(
                    title: "Top 10 Movies",
                    future: model.movieRepository.getTopTenMovies(),
                    model: model),
                MovieCarouselBuilder(
                    title: "New Releases",
                    future: model.movieRepository.getMostRecentMovies(),
                    model: model),
                MovieCarouselBuilder(
                    title: "All Movies",
                    future: model.movieRepository.getAllMovies(),
                    model: model),
              ]);
            })
      ],
    );
  }
}
