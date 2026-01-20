import 'package:flutter/material.dart';
import 'package:map_api_comparison/map_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapApp(),
    );
  }
}