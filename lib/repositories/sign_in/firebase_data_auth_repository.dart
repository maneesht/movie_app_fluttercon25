import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/firebase_auth_repository.dart';
import 'package:movie_app_fluttercon25/services/firebase/firebase_data_service.dart';

class FirebaseDataAuthRepository extends FirebaseAuthRepository
    implements AuthRepository {
  FirebaseDataAuthRepository(
      {required super.firebaseAuthService, required this.firebaseDataService});
  FirebaseDataService firebaseDataService;

  @override
  Future<void> addUser(User user) async {
    await firebaseDataService.addUser(user);
  }
}
