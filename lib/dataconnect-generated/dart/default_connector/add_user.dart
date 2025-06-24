part of 'default.dart';

class AddUserVariablesBuilder {
  String displayName;
  String email;

  final FirebaseDataConnect _dataConnect;
  AddUserVariablesBuilder(this._dataConnect, {required  this.displayName,required  this.email,});
  Deserializer<AddUserData> dataDeserializer = (dynamic json)  => AddUserData.fromJson(jsonDecode(json));
  Serializer<AddUserVariables> varsSerializer = (AddUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddUserData, AddUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddUserData, AddUserVariables> ref() {
    AddUserVariables vars= AddUserVariables(displayName: displayName,email: email,);
    return _dataConnect.mutation("AddUser", dataDeserializer, varsSerializer, vars);
  }
}

class AddUserUserInsert {
  String id;
  AddUserUserInsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddUserUserInsert({
    required this.id,
  });
}

class AddUserData {
  AddUserUserInsert user_insert;
  AddUserData.fromJson(dynamic json):
  user_insert = AddUserUserInsert.fromJson(json['user_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_insert'] = user_insert.toJson();
    return json;
  }

  AddUserData({
    required this.user_insert,
  });
}

class AddUserVariables {
  String displayName;
  String email;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddUserVariables.fromJson(Map<String, dynamic> json):
  displayName = nativeFromJson<String>(json['displayName']),email = nativeFromJson<String>(json['email']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['displayName'] = nativeToJson<String>(displayName);
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  AddUserVariables({
    required this.displayName,
    required this.email,
  });
}

