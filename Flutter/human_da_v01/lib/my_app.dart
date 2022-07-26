import 'package:flutter/material.dart';
import 'package:human_da_v01/pages/create_data_page.dart';
import 'package:human_da_v01/pages/show_base_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ShowDB(),
      routes: {
        "/data_show": (context) => ShowDB(),
        "/data_set": (context) => SetData()
      },
    );
  }
}
