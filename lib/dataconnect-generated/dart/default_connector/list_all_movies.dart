part of 'default.dart';

class ListAllMoviesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListAllMoviesVariablesBuilder(this._dataConnect, );
  Deserializer<ListAllMoviesData> dataDeserializer = (dynamic json)  => ListAllMoviesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListAllMoviesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListAllMoviesData, void> ref() {
    
    return _dataConnect.query("ListAllMovies", dataDeserializer, emptySerializer, null);
  }
}

class ListAllMoviesMovies {
  String id;
  String title;
  int releaseYear;
  double rating;
  String imageUrl;
  String description;
  String genre;
  ListAllMoviesMovies.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),releaseYear = nativeFromJson<int>(json['releaseYear']),rating = nativeFromJson<double>(json['rating']),imageUrl = nativeFromJson<String>(json['imageUrl']),description = nativeFromJson<String>(json['description']),genre = nativeFromJson<String>(json['genre']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['releaseYear'] = nativeToJson<int>(releaseYear);
    json['rating'] = nativeToJson<double>(rating);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    json['description'] = nativeToJson<String>(description);
    json['genre'] = nativeToJson<String>(genre);
    return json;
  }

  ListAllMoviesMovies({
    required this.id,
    required this.title,
    required this.releaseYear,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.genre,
  });
}

class ListAllMoviesData {
  List<ListAllMoviesMovies> movies;
  ListAllMoviesData.fromJson(dynamic json):
  movies = (json['movies'] as List<dynamic>)
        .map((e) => ListAllMoviesMovies.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movies'] = movies.map((e) => e.toJson()).toList();
    return json;
  }

  ListAllMoviesData({
    required this.movies,
  });
}

