import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> signInMobile() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    return (await FirebaseAuth.instance.signInWithPopup(googleProvider)).user!;
  }

  addUserToDatabase(User user) async {
    // TODO(mtewani): add user
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
