import 'package:movie_app_fluttercon25/repositories/movies/movie_repository.dart';
import 'package:movie_app_fluttercon25/repositories/movies/movie_repository_local.dart';
import 'package:movie_app_fluttercon25/services/local/local_data_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create: (context) =>
          MovieRepositoryLocal(localDataService: context.read())
              as MovieRepository,
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
    )
  ];
}
