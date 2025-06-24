import 'package:flutter/material.dart';
import 'package:movie_app_fluttercon25/config/dependencies.dart';
import 'package:movie_app_fluttercon25/main.dart';
import 'package:provider/provider.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';

void main() {
  FirebaseDataConnect fdc = FirebaseDataConnect.instanceFor(
      connectorConfig:
          ConnectorConfig("us-central1", "default", "movieappfluttercon25"));
  fdc.useDataConnectEmulator('10.0.2.2', 9399);
  runApp(MultiProvider(
    providers: providersFirebase,
    child: const MainApp(),
  ));
}
