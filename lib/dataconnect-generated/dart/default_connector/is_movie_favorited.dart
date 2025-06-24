part of 'default.dart';

class IsMovieFavoritedVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  IsMovieFavoritedVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<IsMovieFavoritedData> dataDeserializer = (dynamic json)  => IsMovieFavoritedData.fromJson(jsonDecode(json));
  Serializer<IsMovieFavoritedVariables> varsSerializer = (IsMovieFavoritedVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<IsMovieFavoritedData, IsMovieFavoritedVariables>> execute() {
    return ref().execute();
  }

  QueryRef<IsMovieFavoritedData, IsMovieFavoritedVariables> ref() {
    IsMovieFavoritedVariables vars= IsMovieFavoritedVariables(id: id,);
    return _dataConnect.query("IsMovieFavorited", dataDeserializer, varsSerializer, vars);
  }
}

class IsMovieFavoritedWatchedMovie {
  String movieId;
  IsMovieFavoritedWatchedMovie.fromJson(dynamic json):
  movieId = nativeFromJson<String>(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movieId'] = nativeToJson<String>(movieId);
    return json;
  }

  IsMovieFavoritedWatchedMovie({
    required this.movieId,
  });
}

class IsMovieFavoritedData {
  IsMovieFavoritedWatchedMovie? watchedMovie;
  IsMovieFavoritedData.fromJson(dynamic json):
  watchedMovie = json['watchedMovie'] == null ? null : IsMovieFavoritedWatchedMovie.fromJson(json['watchedMovie']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (watchedMovie != null) {
      json['watchedMovie'] = watchedMovie!.toJson();
    }
    return json;
  }

  IsMovieFavoritedData({
    this.watchedMovie,
  });
}

class IsMovieFavoritedVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  IsMovieFavoritedVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  IsMovieFavoritedVariables({
    required this.id,
  });
}

