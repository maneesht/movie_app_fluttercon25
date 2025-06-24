import 'package:firebase_auth/firebase_auth.dart' show User, UserCredential;

abstract class AuthRepository {
  Future<User> signInMobile();
  Future<User> signInWeb();
  Future<void> addUser(User user);
  Future<void> logOut();
}
