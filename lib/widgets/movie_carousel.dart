import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/pages/home/home.dart';

const double FONT_LARGE = 20;

class MovieCarousel extends StatelessWidget {
  const MovieCarousel(
      {super.key,
      required this.movies,
      required this.title,
      this.size = MovieSize.large});

  final List<Movie> movies;

  final String title;

  final MovieSize size;

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
                    onTap: (int index) {
                      context.push('/movie/${movies[index].id}');
                    },
                    children: movies.map((movie) {
                      return Image.network(movie.imageUrl,
                          fit: BoxFit.fitWidth);
                    }).toList()))
          ],
        ));
  }
}
