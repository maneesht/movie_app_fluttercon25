library default_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'get_top10movies_with_watch_status.dart';

part 'is_movie_favorited.dart';







class DefaultConnector {
  
  
  GetTop10moviesWithWatchStatusVariablesBuilder getTop10moviesWithWatchStatus () {
    return GetTop10moviesWithWatchStatusVariablesBuilder(dataConnect, );
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

