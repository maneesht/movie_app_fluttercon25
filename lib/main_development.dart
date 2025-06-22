import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/dependencies.dart';
import 'package:movie_app_fluttercon25/main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
}
