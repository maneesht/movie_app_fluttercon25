# default_connector SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
DefaultConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetTop10MoviesWithWatchStatus
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.getTop10moviesWithWatchStatus().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetTop10MoviesWithWatchStatusData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.getTop10moviesWithWatchStatus();
GetTop10MoviesWithWatchStatusData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.getTop10moviesWithWatchStatus().ref();
ref.execute();

ref.subscribe(...);
```


### Top10MostRecent
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.top10mostRecent().execute();
```



#### Return Type
`execute()` returns a `QueryResult<Top10MostRecentData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.top10mostRecent();
Top10MostRecentData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.top10mostRecent().ref();
ref.execute();

ref.subscribe(...);
```


### ListAllMovies
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.listAllMovies().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListAllMoviesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.listAllMovies();
ListAllMoviesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.listAllMovies().ref();
ref.execute();

ref.subscribe(...);
```


### IsMovieFavorited
#### Required Arguments
```dart
String id = ...;
DefaultConnector.instance.isMovieFavorited(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<IsMovieFavoritedData, IsMovieFavoritedVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.isMovieFavorited(
  id: id,
);
IsMovieFavoritedData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = DefaultConnector.instance.isMovieFavorited(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### AddUser
#### Required Arguments
```dart
String displayName = ...;
String email = ...;
DefaultConnector.instance.addUser(
  displayName: displayName,
  email: email,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<AddUserData, AddUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.addUser(
  displayName: displayName,
  email: email,
);
AddUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String displayName = ...;
String email = ...;

final ref = DefaultConnector.instance.addUser(
  displayName: displayName,
  email: email,
).ref();
ref.execute();
```


### RemoveWatched
#### Required Arguments
```dart
String movieId = ...;
DefaultConnector.instance.removeWatched(
  movieId: movieId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<RemoveWatchedData, RemoveWatchedVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.removeWatched(
  movieId: movieId,
);
RemoveWatchedData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String movieId = ...;

final ref = DefaultConnector.instance.removeWatched(
  movieId: movieId,
).ref();
ref.execute();
```


### AddWatched
#### Required Arguments
```dart
String movieId = ...;
DefaultConnector.instance.addWatched(
  movieId: movieId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<AddWatchedData, AddWatchedVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.addWatched(
  movieId: movieId,
);
AddWatchedData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String movieId = ...;

final ref = DefaultConnector.instance.addWatched(
  movieId: movieId,
).ref();
ref.execute();
```

