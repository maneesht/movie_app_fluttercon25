part of 'default.dart';

class GetWatchedMoviesVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  GetWatchedMoviesVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<GetWatchedMoviesData> dataDeserializer = (dynamic json)  => GetWatchedMoviesData.fromJson(jsonDecode(json));
  Serializer<GetWatchedMoviesVariables> varsSerializer = (GetWatchedMoviesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetWatchedMoviesData, GetWatchedMoviesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetWatchedMoviesData, GetWatchedMoviesVariables> ref() {
    GetWatchedMoviesVariables vars= GetWatchedMoviesVariables(userId: userId,);
    return _dataConnect.query("getWatchedMovies", dataDeserializer, varsSerializer, vars);
  }
}

class GetWatchedMoviesWatches {
  GetWatchedMoviesWatchesMovie movie;
  GetWatchedMoviesWatches.fromJson(dynamic json):
  movie = GetWatchedMoviesWatchesMovie.fromJson(json['movie']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movie'] = movie.toJson();
    return json;
  }

  GetWatchedMoviesWatches({
    required this.movie,
  });
}

class GetWatchedMoviesWatchesMovie {
  String id;
  String title;
  String description;
  String imageUrl;
  String? externalId;
  GetWatchedMoviesWatchesMovie.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),description = nativeFromJson<String>(json['description']),imageUrl = nativeFromJson<String>(json['imageUrl']),externalId = json['externalId'] == null ? null : nativeFromJson<String>(json['externalId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    if (externalId != null) {
      json['externalId'] = nativeToJson<String?>(externalId);
    }
    return json;
  }

  GetWatchedMoviesWatchesMovie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.externalId,
  });
}

class GetWatchedMoviesData {
  List<GetWatchedMoviesWatches> watches;
  GetWatchedMoviesData.fromJson(dynamic json):
  watches = (json['watches'] as List<dynamic>)
        .map((e) => GetWatchedMoviesWatches.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['watches'] = watches.map((e) => e.toJson()).toList();
    return json;
  }

  GetWatchedMoviesData({
    required this.watches,
  });
}

class GetWatchedMoviesVariables {
  String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetWatchedMoviesVariables.fromJson(Map<String, dynamic> json):
  userId = nativeFromJson<String>(json['userId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  GetWatchedMoviesVariables({
    required this.userId,
  });
}

