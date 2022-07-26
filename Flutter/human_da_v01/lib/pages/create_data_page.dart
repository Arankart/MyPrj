import 'package:flutter/material.dart';

class SetData extends StatefulWidget {
  SetData({Key? key}) : super(key: key);

  @override
  State<SetData> createState() => _SetDataState();
}

class _SetDataState extends State<SetData> {
  bool iconChange = false;
  void _icon_invert() {
    setState(() {
      iconChange = !iconChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Человечник"),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.check))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Имя",
              style: _style(),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Напиши имя",
                  enabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            SizedBox(height: 30),
            Text(
              "Возраст",
              style: _style(),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Напиши возраст",
                  enabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Школоло?",
                  style: _style(),
                ),
                Expanded(child: SizedBox(width: 10)),
                IconButton(
                  onPressed: () {
                    _icon_invert();
                  },
                  icon: Icon(
                    Icons.square_outlined,
                    color: (iconChange == true ? Colors.red : Colors.green),
                    size: 30,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _style() {
  return TextStyle(color: Colors.black, fontSize: 24);
}
