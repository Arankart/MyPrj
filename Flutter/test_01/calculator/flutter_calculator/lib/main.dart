// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color(0xFF383838)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    // minimumSize: MaterialStateProperty.all(Size(74, 74))
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final double sizeOfBox = 74.0;

  Widget calcButton(
      String btntxt, Color btncolor, Color txtcolor, double? txt_size) {
    return Container(
      child: OutlinedButton(
          onPressed: () {
            calculation(btntxt);
          },
          child: Text(btntxt,
              style: TextStyle(color: txtcolor, fontSize: txt_size)),
          style: MyApp.style),
      width: sizeOfBox,
      height: sizeOfBox,
    );
  }

  Widget calcButtonDesign(
      String btntxt, Color btncolor, Color txtcolor, double? txt_size) {
    return Container(
      child: OutlinedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child:
            Text(btntxt, style: TextStyle(color: txtcolor, fontSize: txt_size)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFf15025)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        ),
      ),
      width: sizeOfBox,
      height: sizeOfBox,
    );
  }

  Widget calcButtonDesignTwo(
      String btntxt, Color btncolor, Color txtcolor, double? txt_size) {
    return Container(
      child: OutlinedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child:
            Text(btntxt, style: TextStyle(color: txtcolor, fontSize: txt_size)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFC9C9C9)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        ),
      ),
      width: sizeOfBox,
      height: sizeOfBox,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            color: Color(0xFF0A0A0A),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 96,
                  width: double.infinity,
                  child: FittedBox(
                    alignment: Alignment.centerRight,
                    child: Text(
                      text,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 96, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButtonDesignTwo("C", Colors.red, Color(0xFF22223B), 48),
                  calcButtonDesignTwo(
                      "±", Color(0xFFF1F0F8), Color(0xFF22223B), 48),
                  calcButtonDesignTwo(
                      "%", Color(0xFFF1F0F8), Color(0xFF22223B), 48),
                  calcButtonDesign(
                      "÷", Color(0xFFF1F0F8), Color(0xFFF1F0F8), 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("7", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButton("8", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButton("9", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButtonDesign(
                      "×", Color(0xFFF1F0F8), Color(0xFFF1F0F8), 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("4", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButton("5", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButton("6", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButtonDesign(
                      "-", Color(0xFFF1F0F8), Color(0xFFF1F0F8), 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("1", Color(0xFFF130F8), Color(0xFFFFFFFF), 48),
                  calcButton("2", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButton("3", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                  calcButtonDesign(
                      "+", Color(0xFFF1F0F8), Color(0xFFF1F0F8), 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 74,
                    width: 148,
                    child: Container(
                      child: OutlinedButton(
                        onPressed: () {
                          calculation("0");
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.only(left: 23)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF383838)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        child: Row(
                          children: [
                            Text("0",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 48)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: 168,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          calcButton(
                              ",", Color(0xFFF1F0F8), Color(0xFFFFFFFF), 48),
                          calcButtonDesign(
                              "=", Color(0xFFF1F0F8), Color(0xFFF1F0F8), 48),
                        ],
                      )
                    ]),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  // Логика калькулятора
  dynamic text = '0';

  double numOne = 0;

  double numTwo = 0;

  dynamic result = '';

  dynamic finalResult = '';

  dynamic opr = '';

  dynamic preOpr = '';

  bool inOpr = false;

  List<String> num = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ]; // , ","

  void calculation(btnText) {
    if (numTwo != 0) {
      numOne = 0;
      numTwo = 0;
      choise(btnText);
    } else {
      choise(btnText);
    }
    setState(() {
      text;
    });
  }

  void choise(btnText) {
    // Нажатие на кнопку сброса
    if (btnText == "C") {
      text = "0";
    }

    if (btnText == ",") {
      text = text + ",";
    }

    // Замена числа на противоположное
    if (btnText == "±") {
      double text_binar = 0;
      text_binar = double.parse(text);
      numOne.toStringAsFixed(2);

      if (text_binar < 0) {
        text = (text_binar * (-1)).toString();
      } else {
        text = "-" + text;
      }
    }

    // !!!! Выбор действия с числом !!!!
    if (inOpr == false) {
      if (btnText == '+' ||
          btnText == '-' ||
          btnText == '×' ||
          btnText == '÷') {
        text = text.replaceAll(',', '.');
        print(text);
        numOne = double.parse(text);
        numOne.toStringAsFixed(2);
        text = text.replaceAll('.', ',');
        opr = btnText;
        text = "0";
        print(opr);
      }
    }

    if (btnText == '=') {
      if (numOne != 0) {
        text = text.replaceAll(',', '.');
        numTwo = double.parse(text);
        numTwo.toStringAsFixed(2);
        text = text.replaceAll('.', ',');
        if (opr == '+') {
          result = add();
          text = result;
          text = text.replaceAll('.', ',');
        } else if (opr == '-') {
          result = sub();
          text = result;
          text = text.replaceAll('.', ',');
        } else if (opr == '÷') {
          result = div();
          text = result;
          text = text.replaceAll('.', ',');
        } else if (opr == '×') {
          result = mul();
          text = result;

          text = text.replaceAll('.', ',');
        }
      }
    } else if (btnText == '%') {
      text = text.replaceAll(',', '.');
      numTwo = double.parse(text);
      numTwo.toStringAsFixed(2);
      text = text.replaceAll('.', ',');
      result = ((numOne / 100) * numTwo);
      numOne = result;
      text = result.toString();
      text = text.replaceAll('.', ',');
    }

    // Код для набора чисел
    if (btnText == num_enter(num, btnText)) {
      if (text[0] == "0" || btnText != ",") {
        text = btnText;
        text = text.replaceAll('.', ',');
      } else
        text = text + btnText;
      text = text.replaceAll('.', ',');
    }
  }

  String num_enter(List<String> num, String btnText) {
    dynamic character = "0";

    for (int i = 0; i < num.length; i++) {
      if (num[i] == btnText) {
        character = num[i].toString();
      }
    }

    if (btnText == character) {
      if (text[0] == "0") {
        if (text == '0') {
          text = btnText;
        } else {
          text = text + btnText;
        }
      } else
        text = text + btnText;
    }
    return text.toString();
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    numOne.toStringAsFixed(2);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    numOne.toStringAsFixed(2);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    numOne.toStringAsFixed(2);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    numOne.toStringAsFixed(2);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
