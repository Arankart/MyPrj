import 'package:cycle_app/pages/training_data_page.dart';
import 'package:cycle_app/pages/trainings_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.grey,
        backgroundColor: Colors.pink,
      ),
      routes: {
        '/training_list': (context) => TrainingListPage(),
        "/training_set": (context) => TrainignDataPage(),
      },
      initialRoute: "/",
      home: TrainingListPage(),
    );
  }
}
