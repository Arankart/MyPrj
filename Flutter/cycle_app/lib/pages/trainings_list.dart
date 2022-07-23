import 'package:cycle_app/pages/training_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TrainingListPage extends StatelessWidget {
  const TrainingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white.withOpacity(0.04),
          title: Text(
            "Твои тренировки",
            style: txtStyle(16, FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            card(context),
            sizeBox(30, 0),
            textButton("Добавить тренировку", Colors.grey.shade200,
                Colors.grey.shade400, context, "/training_set"),
          ],
        ),
      ),
    );
  }
}

Widget card(dynamic context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("1. Цигун", style: txtStyle(24, FontWeight.w600)),
      sizeBox(16, 0),
      Text(
        "Тренировка цигун, несколько статичных стоек, укрепляем мышцы и медитируем",
        style: txtStyle(16, FontWeight.w500),
      ),
      sizeBox(16, 0),
      Row(
        children: [
          Expanded(
              child: textButton("Изменить", Colors.grey, Colors.white, context,
                  "/training_set")),
          sizeBox(0, 24),
          Expanded(
              child:
                  textButton("Старт", Colors.black, Colors.white, context, "")),
        ],
      ),
      sizeBox(32, 0),
      divider("name")
    ],
  );
}

Widget textButton(String text, Color colorBttn, Color colorText,
    dynamic context, String path) {
  return ElevatedButton(
    onPressed: () {
      if (path != "") {
        Navigator.pushNamed(context, path);
      }
    },
    child: Text(
      text,
      style: TextStyle(color: colorText, fontSize: 18),
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorBttn),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.04))),
  );
}

TextStyle txtStyle(double size, FontWeight weight) {
  return TextStyle(color: Colors.black, fontSize: size, fontWeight: weight);
}
