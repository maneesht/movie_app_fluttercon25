import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/model/movie_json.dart';
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
        FutureBuilder(
            future: model.movieRepository.getMovies(),
            builder: (context, AsyncSnapshot<MovieJson> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return MovieCarousel(
                    movies: snapshot.data!.featured, title: "Featured Movies");
              } else {
                return const CircularProgressIndicator();
              }
            }),
        FutureBuilder(
          future: model.movieRepository.getMovies(),
          builder: (context, AsyncSnapshot<MovieJson> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return MovieCarousel(
                  movies: snapshot.data!.newReleases,
                  title: "New Releases",
                  size: MovieSize.small);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        FutureBuilder(
          future: model.movieRepository.getMovies(),
          builder: (context, AsyncSnapshot<MovieJson> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return MovieCarousel(
                  movies: snapshot.data!.newReleases,
                  title: "Most Popular",
                  size: MovieSize.small);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
