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
          title: Text(
            "Твои тренировки",
            style: txtStyle(16, FontWeight.w600),
          )),
      body: TrainingsList(),
      floatingActionButton: FloatingActionButton(
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

  List<Training>? _trainingList;

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    updateList();
  }

  updateList() {
    setState() {
      _trainingListFuture = DBProvider.db.getTrainings();
      trainingView();
    }
  }

  trainingView() async {
    _trainingList = await _trainingListFuture;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Text("${_trainingList}");
        },
      );
    });
  }
}

// sizeBox(30, 0),
// textButton("Добавить тренировку", Colors.grey.shade200,
//     Colors.grey.shade400, context, "/training_set"),

Widget card(dynamic context, Training training, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("$index ${training.title}", style: txtStyle(24, FontWeight.w600)),
      sizeBox(16, 0),
      Text(
        training.description,
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
