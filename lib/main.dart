import 'package:flutter/material.dart';
import 'package:myapp/views%20/planetas_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planetas App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlanetasList(),
    );
  }
}