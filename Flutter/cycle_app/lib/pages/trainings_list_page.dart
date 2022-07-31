import 'package:cycle_app/db/database_model.dart';
import 'package:cycle_app/pages/training_data_page.dart';
import 'package:flutter/material.dart';

import '../model/training_data_model.dart';

class TrainingListPage extends StatelessWidget {
  const TrainingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white.withOpacity(0.04),
          title: Row(
            children: [
              Text(
                "Твои тренировки",
                style: txtStyle(16, FontWeight.w600),
              ),
              Expanded(child: sizeBox(16, 0)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_outlined),
                iconSize: 30,
              )
            ],
          )),
      body: TrainingsList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.grey.shade300,
        onPressed: (() {
          Navigator.pushNamed(context, "/training_set");
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}

class TrainingsList extends StatefulWidget {
  TrainingsList({Key? key}) : super(key: key);

  @override
  State<TrainingsList> createState() => _TrainingsListState();
}

class _TrainingsListState extends State<TrainingsList> {
  Future<List<Training>>? _trainingListFuture;
  List<Training>? list_training = [];

  int? id_for_delete;

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    updateList();
  }

  updateList() {
    setState(() {
      _trainingListFuture = DBProvider.db.getTrainings();
    });
    print("Список обновился");
  }

  deleteObj() {
    if (id_for_delete != null) {
      DBProvider.db.deleteTraining(id_for_delete as int);
    }
  }

  trainingView() async {
    List<Training>? lt = await _trainingListFuture;
    // lt?.forEach((e) {
    //   count++;
    //   print("Id: ${count} , title: ${e.title}");
    // });
    // print("---------");
  }

  @override
  Widget build(BuildContext context) {
    return MyIheritedListWidget(
      myListState: this,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FutureBuilder(
            future: _trainingListFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: (snapshot.data as List<Training>).length,
                  itemBuilder: (contex, index) {
                    return card(context,
                        (snapshot.data as List<Training>)[index], index);
                  },
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
            }),
      ),
    );
  }
}

Widget textButton(String text, Color colorBttn, Color colorText,
    dynamic context, String path, Training training, int index) {
  return ElevatedButton(
    onPressed: () {
      print("context:" + context.toString());
      print("path:" + path);

      if (path != "") {
        print("id_trains:" + index.toString());
        int? id_trains = index;
        Navigator.pushNamed(context, path, arguments: id_trains);
      }
    },
    child: Text(
      text,
      style: TextStyle(color: colorText, fontSize: 18),
    ),
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: MaterialStateProperty.all(colorBttn),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.04)),
        minimumSize: MaterialStateProperty.all(Size(0, 42))),
  );
}

TextStyle txtStyle(double size, FontWeight weight) {
  return TextStyle(color: Colors.black, fontSize: size, fontWeight: weight);
}

Widget card(dynamic context, Training training, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      sizeBox(32, 0),
      Row(
        children: [
          Text("${index + 1}. ${training.title}",
              style: txtStyle(24, FontWeight.w600)),
          Expanded(child: sizeBox(16, 0)),
          IconButton(
            onPressed: () {
              DBProvider.db.deleteTraining(index + 1);
            },
            icon: Icon(Icons.delete),
            color: Color(0xFFFF6060),
          )
        ],
      ),
      sizeBox(16, 0),
      Text(
        training.description,
        style: txtStyle(16, FontWeight.w500),
      ),
      sizeBox(16, 0),
      Row(
        children: [
          Expanded(
              child: textButton("Изменить", Color(0xFFFF6060), Colors.white,
                  context, "/training_set", training, index)),
          sizeBox(0, 40),
          Expanded(
              child: textButton("Старт", Colors.black, Colors.white, context,
                  "", training, index)),
        ],
      ),
      sizeBox(32, 0),
      divider("name")
    ],
  );
}

class MyIheritedListWidget extends InheritedWidget {
  final Widget child;
  _TrainingsListState myListState;

  MyIheritedListWidget(
      {Key? key, required this.child, required this.myListState})
      : super(key: key, child: child);

  static MyIheritedListWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyIheritedListWidget>();
  }

  @override
  bool updateShouldNotify(MyIheritedListWidget oldWidget) {
    return true;
  }
}
