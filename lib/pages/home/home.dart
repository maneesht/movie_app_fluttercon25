import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/ui/movie_carousel_builder.dart';

import 'home_viewmodel.dart';

enum MovieSize { small, large }

class Home extends StatelessWidget {
  Home({super.key, required this.model});
  final HomeViewModel model;
  final List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.uid);
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
              onPressed: () async {
                await model.signOut();
                if (context.mounted) {
                  context.go('/sign-in');
                }
              },
              icon: const Icon(Icons.account_circle),
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
