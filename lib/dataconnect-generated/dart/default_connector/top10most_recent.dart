part of 'default.dart';

class Top10mostRecentVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  Top10mostRecentVariablesBuilder(this._dataConnect, );
  Deserializer<Top10mostRecentData> dataDeserializer = (dynamic json)  => Top10mostRecentData.fromJson(jsonDecode(json));
  
  Future<QueryResult<Top10mostRecentData, void>> execute() {
    return ref().execute();
  }

  QueryRef<Top10mostRecentData, void> ref() {
    
    return _dataConnect.query("Top10MostRecent", dataDeserializer, emptySerializer, null);
  }
}

class Top10mostRecentMovies {
  String id;
  String title;
  int releaseYear;
  double rating;
  String imageUrl;
  String description;
  String genre;
  Top10mostRecentMovies.fromJson(dynamic json):
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

  Top10mostRecentMovies({
    required this.id,
    required this.title,
    required this.releaseYear,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.genre,
  });
}

class Top10mostRecentData {
  List<Top10mostRecentMovies> movies;
  Top10mostRecentData.fromJson(dynamic json):
  movies = (json['movies'] as List<dynamic>)
        .map((e) => Top10mostRecentMovies.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movies'] = movies.map((e) => e.toJson()).toList();
    return json;
  }

  Top10mostRecentData({
    required this.movies,
  });
}

