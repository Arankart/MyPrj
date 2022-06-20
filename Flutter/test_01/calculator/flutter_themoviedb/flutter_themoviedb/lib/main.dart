import 'package:flutter/material.dart';
import 'package:flutter_themoviedb/widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film search',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromRGBO(217, 4, 41, 1))),
      home: AuthWidget(),
    );
  }
}
