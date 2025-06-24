import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/services/firebase/firebase_auth_service.dart';

class FirebaseAuthRepository {
  FirebaseAuthRepository({required this.firebaseAuthService});
  FirebaseAuthService firebaseAuthService;
  Future<User> signInMobile() async {
    return firebaseAuthService.signInMobile();
  }

  Future<User> signInWeb() async {
    return firebaseAuthService.signInWeb();
  }

  Future<void> logOut() async {
    await firebaseAuthService.signOut();
  }
}
