library default_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'add_user.dart';

part 'remove_watched.dart';

part 'add_watched.dart';

part 'get_top10movies_with_watch_status.dart';

part 'top10most_recent.dart';

part 'list_all_movies.dart';

part 'is_movie_favorited.dart';







class DefaultConnector {
  
  
  AddUserVariablesBuilder addUser ({required String displayName, required String email, }) {
    return AddUserVariablesBuilder(dataConnect, displayName: displayName,email: email,);
  }
  
  
  RemoveWatchedVariablesBuilder removeWatched ({required String movieId, }) {
    return RemoveWatchedVariablesBuilder(dataConnect, movieId: movieId,);
  }
  
  
  AddWatchedVariablesBuilder addWatched ({required String movieId, }) {
    return AddWatchedVariablesBuilder(dataConnect, movieId: movieId,);
  }
  
  
  GetTop10moviesWithWatchStatusVariablesBuilder getTop10moviesWithWatchStatus () {
    return GetTop10moviesWithWatchStatusVariablesBuilder(dataConnect, );
  }
  
  
  Top10mostRecentVariablesBuilder top10mostRecent () {
    return Top10mostRecentVariablesBuilder(dataConnect, );
  }
  
  
  ListAllMoviesVariablesBuilder listAllMovies () {
    return ListAllMoviesVariablesBuilder(dataConnect, );
  }
  
  
  IsMovieFavoritedVariablesBuilder isMovieFavorited ({required String id, }) {
    return IsMovieFavoritedVariablesBuilder(dataConnect, id: id,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'default',
    'movieappfluttercon25',
  );

  DefaultConnector({required this.dataConnect});
  static DefaultConnector get instance {
    return DefaultConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

