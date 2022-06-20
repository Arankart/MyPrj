import 'package:flutter/material.dart';
import 'package:flutter_test02/second_page.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Privet",
          style: TextStyle(fontSize: 24),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Text("Нажми меня"))
      ],
    ));
  }
}
