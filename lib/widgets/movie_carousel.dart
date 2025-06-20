import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key, required this.movies, required this.title});

  final List<Movie> movies;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: CarouselView(
                scrollDirection: Axis.horizontal,
                itemExtent: 200.0,
                children: movies.map((movie) {
                  return Image.network(movie.imageUrl, fit: BoxFit.cover);
                }).toList()))
      ],
    );
  }
}
