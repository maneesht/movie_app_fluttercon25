part of 'default.dart';

class GetTop10moviesWithWatchStatusVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetTop10moviesWithWatchStatusVariablesBuilder(this._dataConnect, );
  Deserializer<GetTop10moviesWithWatchStatusData> dataDeserializer = (dynamic json)  => GetTop10moviesWithWatchStatusData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetTop10moviesWithWatchStatusData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetTop10moviesWithWatchStatusData, void> ref() {
    
    return _dataConnect.query("GetTop10MoviesWithWatchStatus", dataDeserializer, emptySerializer, null);
  }
}

class GetTop10moviesWithWatchStatusMovies {
  String id;
  String title;
  int? releaseYear;
  double? rating;
  String? imageUrl;
  GetTop10moviesWithWatchStatusMovies.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),releaseYear = json['releaseYear'] == null ? null : nativeFromJson<int>(json['releaseYear']),rating = json['rating'] == null ? null : nativeFromJson<double>(json['rating']),imageUrl = json['imageUrl'] == null ? null : nativeFromJson<String>(json['imageUrl']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    if (releaseYear != null) {
      json['releaseYear'] = nativeToJson<int?>(releaseYear);
    }
    if (rating != null) {
      json['rating'] = nativeToJson<double?>(rating);
    }
    if (imageUrl != null) {
      json['imageUrl'] = nativeToJson<String?>(imageUrl);
    }
    return json;
  }

  GetTop10moviesWithWatchStatusMovies({
    required this.id,
    required this.title,
    this.releaseYear,
    this.rating,
    this.imageUrl,
  });
}

class GetTop10moviesWithWatchStatusData {
  List<GetTop10moviesWithWatchStatusMovies> movies;
  GetTop10moviesWithWatchStatusData.fromJson(dynamic json):
  movies = (json['movies'] as List<dynamic>)
        .map((e) => GetTop10moviesWithWatchStatusMovies.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movies'] = movies.map((e) => e.toJson()).toList();
    return json;
  }

  GetTop10moviesWithWatchStatusData({
    required this.movies,
  });
}

