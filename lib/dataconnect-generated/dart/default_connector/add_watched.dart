part of 'default.dart';

class AddWatchedVariablesBuilder {
  String movieId;

  final FirebaseDataConnect _dataConnect;
  AddWatchedVariablesBuilder(this._dataConnect, {required  this.movieId,});
  Deserializer<AddWatchedData> dataDeserializer = (dynamic json)  => AddWatchedData.fromJson(jsonDecode(json));
  Serializer<AddWatchedVariables> varsSerializer = (AddWatchedVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddWatchedData, AddWatchedVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddWatchedData, AddWatchedVariables> ref() {
    AddWatchedVariables vars= AddWatchedVariables(movieId: movieId,);
    return _dataConnect.mutation("AddWatched", dataDeserializer, varsSerializer, vars);
  }
}

class AddWatchedWatchedMovieInsert {
  String userId;
  String movieId;
  AddWatchedWatchedMovieInsert.fromJson(dynamic json):
  userId = nativeFromJson<String>(json['userId']),movieId = nativeFromJson<String>(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['movieId'] = nativeToJson<String>(movieId);
    return json;
  }

  AddWatchedWatchedMovieInsert({
    required this.userId,
    required this.movieId,
  });
}

class AddWatchedData {
  AddWatchedWatchedMovieInsert watchedMovie_insert;
  AddWatchedData.fromJson(dynamic json):
  watchedMovie_insert = AddWatchedWatchedMovieInsert.fromJson(json['watchedMovie_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['watchedMovie_insert'] = watchedMovie_insert.toJson();
    return json;
  }

  AddWatchedData({
    required this.watchedMovie_insert,
  });
}

class AddWatchedVariables {
  String movieId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddWatchedVariables.fromJson(Map<String, dynamic> json):
  movieId = nativeFromJson<String>(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movieId'] = nativeToJson<String>(movieId);
    return json;
  }

  AddWatchedVariables({
    required this.movieId,
  });
}

