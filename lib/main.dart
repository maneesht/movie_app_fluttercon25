import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';
import 'package:movie_app_fluttercon25/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode
          .dark, // TODO: Use system and change system default to dark mode
    );
  }
}
