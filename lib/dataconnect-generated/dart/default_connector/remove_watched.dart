part of 'default.dart';

class RemoveWatchedVariablesBuilder {
  String movieId;

  final FirebaseDataConnect _dataConnect;
  RemoveWatchedVariablesBuilder(this._dataConnect, {required  this.movieId,});
  Deserializer<RemoveWatchedData> dataDeserializer = (dynamic json)  => RemoveWatchedData.fromJson(jsonDecode(json));
  Serializer<RemoveWatchedVariables> varsSerializer = (RemoveWatchedVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RemoveWatchedData, RemoveWatchedVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RemoveWatchedData, RemoveWatchedVariables> ref() {
    RemoveWatchedVariables vars= RemoveWatchedVariables(movieId: movieId,);
    return _dataConnect.mutation("RemoveWatched", dataDeserializer, varsSerializer, vars);
  }
}

class RemoveWatchedWatchedMovieDelete {
  String userId;
  String movieId;
  RemoveWatchedWatchedMovieDelete.fromJson(dynamic json):
  userId = nativeFromJson<String>(json['userId']),movieId = nativeFromJson<String>(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['movieId'] = nativeToJson<String>(movieId);
    return json;
  }

  RemoveWatchedWatchedMovieDelete({
    required this.userId,
    required this.movieId,
  });
}

class RemoveWatchedData {
  RemoveWatchedWatchedMovieDelete? watchedMovie_delete;
  RemoveWatchedData.fromJson(dynamic json):
  watchedMovie_delete = json['watchedMovie_delete'] == null ? null : RemoveWatchedWatchedMovieDelete.fromJson(json['watchedMovie_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (watchedMovie_delete != null) {
      json['watchedMovie_delete'] = watchedMovie_delete!.toJson();
    }
    return json;
  }

  RemoveWatchedData({
    this.watchedMovie_delete,
  });
}

class RemoveWatchedVariables {
  String movieId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RemoveWatchedVariables.fromJson(Map<String, dynamic> json):
  movieId = nativeFromJson<String>(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movieId'] = nativeToJson<String>(movieId);
    return json;
  }

  RemoveWatchedVariables({
    required this.movieId,
  });
}

