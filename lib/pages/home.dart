import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/model/movie.dart';
import 'package:movie_app_fluttercon25/model/serializer.dart';
import 'package:movie_app_fluttercon25/widgets/movie_carousel.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              'ReelTime',
              style: TextStyle(fontSize: 30),
            )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 30,
            ),
          ],
        ),
        Expanded(
          flex: 2,
          child: FutureBuilder(
              future: Serializer.serialize(),
              builder: (context, AsyncSnapshot<MovieJson> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return MovieCarousel(
                      movies: snapshot.data!.featured,
                      title: "Featured Movies");
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
        Expanded(
          flex: 2,
          child: FutureBuilder(
              future: Serializer.serialize(),
              builder: (context, AsyncSnapshot<MovieJson> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return MovieCarousel(
                      movies: snapshot.data!.newReleases,
                      title: "New Releases");
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}
