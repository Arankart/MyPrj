import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrainignDataPage extends StatelessWidget {
  const TrainignDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.04),
        title: textFieldAppBar(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              children: [
                description(),
                Block(name: "Подготовка"),
                Block(name: "Работа"),
                Block(name: "Отдых"),
                Block(name: "Цикл"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Block extends StatelessWidget {
  String name;
  Block({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeBox(30, 0),
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "0 сек", enabledBorder: InputBorder.none),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                ),
              ),
              sizeBox(0, 24),
              elButton(Icons.add),
              sizeBox(0, 24),
              elButton(Icons.remove),
            ],
          ),
        ),
        sizeBox(30, 0),
        divider(name),
      ],
    );
  }
}

Widget divider(String name) {
  return name != "Цикл"
      ? Divider(
          thickness: 0.5,
        )
      : SizedBox();
}

Widget textFieldAppBar() {
  return TextField(
    decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        hintText: "Название тренировки",
        hintStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        suffixIcon: Icon(Icons.check),
        suffixIconColor: Colors.black),
  );
}

Widget description() {
  return TextField(
    decoration: const InputDecoration(
        // icon: Icon(Icons.edit),
        hintText: "Описание тренировки",
        hintStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        enabledBorder: InputBorder.none),
  );
}

Widget sizeBox(double sizeH, double sizeW) {
  return SizedBox(
    height: sizeH,
    width: sizeW,
  );
}

Widget elButton(
  IconData icon,
) {
  return ElevatedButton(
    onPressed: () {},
    child: Icon(
      icon,
      color: Colors.white,
    ),
    // Text(
    //   icon,
    //   style: TextStyle(color: Colors.white, fontSize: 30),
    // ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    ),
  );
}
