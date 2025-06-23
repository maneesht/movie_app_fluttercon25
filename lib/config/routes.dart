import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/pages/home/home.dart';
import 'package:movie_app_fluttercon25/pages/home/home_viewmodel.dart';
import 'package:movie_app_fluttercon25/pages/sign_in/sign_in.dart';
import 'package:movie_app_fluttercon25/pages/sign_in/signin_viewmodel.dart';
import 'package:provider/provider.dart';

import '../pages/detail/movie_detail.dart';

const signInPath = '/sign-in';
const homePath = '/';
const movieDetailPath = '/movie/:movieId';
final goRouter = GoRouter(
    redirect: (context, state) async {
      User? user = (await FirebaseAuth.instance.userChanges().first);
      if (user != null) {
        return null;
      }
      return signInPath;
    },
    routes: routes,
    initialLocation: homePath);
final List<GoRoute> routes = [
  GoRoute(
      path: movieDetailPath,
      name: 'movie-detail',
      builder: (BuildContext context, GoRouterState state) {
        final id = state.pathParameters['movieId']!;
        return MovieDetail(id: id, movieRepository: context.read());
      }),
  GoRoute(
      path: homePath,
      builder: (context, state) =>
          Home(model: HomeViewModel(movieRepository: context.read()))),
  GoRoute(
      path: signInPath,
      builder: (context, state) => SignIn(
            model: SigninViewModel(authRepository: context.read()),
          ))
];
