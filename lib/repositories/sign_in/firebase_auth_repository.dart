import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';
import 'package:movie_app_fluttercon25/services/firebase/firebase_auth_service.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({required this.firebaseAuthService});
  FirebaseAuthService firebaseAuthService;
  @override
  Future<User> signInMobile() async {
    return firebaseAuthService.signInMobile();
  }

  @override
  Future<User> signInWeb() async {
    return firebaseAuthService.signInWeb();
  }

  @override
  Future<void> addUser(User user) async {
    await firebaseAuthService.addUserToDatabase(user);
  }

  @override
  Future<void> logOut() async {
    await firebaseAuthService.signOut();
  }
}
