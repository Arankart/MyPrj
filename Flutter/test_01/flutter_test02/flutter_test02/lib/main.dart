import 'package:flutter/material.dart';
import 'package:flutter_test02/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tutorial 2",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            body: Scaffold(
                appBar: AppBar(
                  title: Text('Тестовое приложение'),
                  shadowColor: null,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                body: Example())));
  }
}
