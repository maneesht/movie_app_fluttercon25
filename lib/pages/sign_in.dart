import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  signInWithGoogle() async {
    // Trigger the authentication flow

    // Once signed in, return the UserCredential
    try {
      if (!kIsWeb) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
      }
      goRouter.push(homePath);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          ElevatedButton(
              onPressed: signInWithGoogle, child: const Text("Sign In"))
        ],
      ),
    );
  }
}
