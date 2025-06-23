import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';
import 'package:movie_app_fluttercon25/repositories/sign_in/auth_repository.dart';

class SigninViewModel {
  SigninViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;
  // Insert UserRepository
  Future<bool> signInWithGoogle() async {
    try {
      User signedIn;
      if (kIsWeb) {
        signedIn = await _authRepository.signInWeb();
      } else {
        signedIn = await _authRepository.signInMobile();
      }
      await _authRepository.addUser(signedIn);
      return true;
    } catch (_) {
      return false;
    }
  }
}
