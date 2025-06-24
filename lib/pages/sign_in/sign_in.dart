import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';
import 'package:movie_app_fluttercon25/pages/sign_in/signin_viewmodel.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.model});
  final SigninViewModel model;
  signInWithGoogle() async {
    if (await model.signInWithGoogle()) {
      goRouter.go(homePath);
    } else {
      print('oops!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: signInWithGoogle,
              child: Row(
                spacing: 8.0,
                children: [
                  Image.network(
                    "https://www.gstatic.com/images/branding/productlogos/googleg/v6/web-36dp/logo_googleg_color_1x_web_36dp.png",
                    height: 15,
                  ),
                  const Text("Sign in with Google",
                      style: TextStyle(fontSize: 15))
                ],
              ))
        ],
      ),
    );
  }
}
