import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository_local.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/firebase_auth_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/firebase_data_auth_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/local_auth_repository.dart';
import 'package:movie_app_fluttercon25/services/firebase/firebase_auth_service.dart';
import 'package:movie_app_fluttercon25/services/local/local_data_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repositories/movies/movie_repository_firebase.dart';
import '../services/firebase/firebase_data_service.dart';

List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create: (context) =>
          MovieRepositoryLocal(localDataService: context.read())
              as MovieRepository,
    ),
    Provider.value(value: FirebaseAuthService()),
    Provider(
      create: (context) => LocalAuthRepository(
          firebaseAuthService: context.read(),
          localDataService: context.read()) as AuthRepository,
    )
  ];
}

List<SingleChildWidget> get providersFirebase {
  return [
    Provider.value(value: FirebaseDataService()),
    Provider(
      create: (context) =>
          MovieRepositoryFirebase(firebaseDataService: context.read())
              as MovieRepository,
    ),
    Provider.value(value: FirebaseAuthService()),
    Provider(
      create: (context) => FirebaseDataAuthRepository(
          firebaseAuthService: context.read(),
          firebaseDataService: context.read()) as AuthRepository,
    )
  ];
}
