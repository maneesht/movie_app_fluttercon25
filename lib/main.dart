import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/routes.dart';
import 'package:movie_app_fluttercon25/pages/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_development.dart' as development;
// import 'firebase_development.dart' as firebaseDevelopment;
import 'firebase_options.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  development.main();
  // runApp(const MainApp());
  // TODO: Use Firebase environment
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      builder: (context, child) => Scaffold(
        body: SafeArea(child: child!),
      ),
      themeMode: ThemeMode
          .dark, // TODO: Use system and change system default to dark mode
    );
  }
}
