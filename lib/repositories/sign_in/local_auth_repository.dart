import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/firebase_auth_repository.dart';
import 'package:movie_app_fluttercon25/services/local/local_data_service.dart';

class LocalAuthRepository extends FirebaseAuthRepository
    implements AuthRepository {
  LocalAuthRepository(
      {required super.firebaseAuthService, required this.localDataService});
  LocalDataService localDataService;

  @override
  Future<void> addUser(User user) async {
    await localDataService.addUser(user);
  }
}
