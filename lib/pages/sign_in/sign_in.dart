import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';
import 'package:movie_app_fluttercon25/pages/sign_in/signin_viewmodel.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.model});
  final SigninViewModel model;
  signInWithGoogle() async {
    if (await model.signInWithGoogle()) {
      goRouter.go(homePath);
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
