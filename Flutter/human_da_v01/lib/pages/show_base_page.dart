import 'package:flutter/material.dart';

class ShowDB extends StatefulWidget {
  const ShowDB({Key? key}) : super(key: key);

  @override
  State<ShowDB> createState() => _ShowDBState();
}

class _ShowDBState extends State<ShowDB> {
  bool iconChange = false;

  void _icon_invert() {
    setState(() {
      iconChange = !iconChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Человечник")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyInheritedWidget(
                  myState: this,
                  child: Card_class(name: "Вася", age: "15 лет")),
              Divider(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/data_set");
                  },
                  child: Text("Добавить человека"))
            ]),
      ),
    );
  }
}

class Card_class extends StatelessWidget {
  final String name;
  final String age;
  Card_class({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootState = MyInheritedWidget.of(context)?.myState;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: _style(),
            ),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            Text(age, style: _style()),
          ],
        ),
        Row(
          children: [
            Text("Школьник", style: _style()),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            IconButton(
              onPressed: () {
                rootState!._icon_invert();
              },
              icon: Icon(
                Icons.square_outlined,
                color:
                    (rootState?.iconChange == true ? Colors.red : Colors.green),
                size: 30,
              ),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Изменить"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
        )
      ],
    );
    ;
  }
}

TextStyle _style() {
  return TextStyle(color: Colors.black, fontSize: 24);
}

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final _ShowDBState myState;

  MyInheritedWidget({Key? key, required this.myState, required this.child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return myState.iconChange != oldWidget.myState.iconChange;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
