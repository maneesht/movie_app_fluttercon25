import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/pages/home/home.dart';

import '../pages/home/home_viewmodel.dart';

const double FONT_LARGE = 20;

class MovieCarousel extends StatelessWidget {
  const MovieCarousel(
      {super.key,
      required this.movies,
      required this.title,
      this.size = MovieSize.large,
      required this.model});

  final List<Movie> movies;

  final String title;

  final MovieSize size;

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MovieSize.large == size ? 300 : 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: FONT_LARGE, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: CarouselView(
                    scrollDirection: Axis.horizontal,
                    itemExtent: MovieSize.large == size ? 200 : 160,
                    enableSplash: false,
                    children: movies.map((movie) {
                      return FutureBuilder(
                          future: model.movieRepository.isWatched(movie.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.stackTrace);
                              return Text(snapshot.error.toString());
                            }
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            final isWatched = snapshot.data!;
                            return Stack(children: [
                              InkWell(
                                child: Image.network(movie.imageUrl,
                                    fit: BoxFit.fitWidth),
                                onTap: () {
                                  context.push('/movie/${movie.id}');
                                },
                              ),
                              IconButton(
                                  onPressed: () {
                                    model.toggleWatched(movie.id);
                                  },
                                  icon: Icon(isWatched
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined))
                            ]);
                          });
                    }).toList()))
          ],
        ));
  }
}
