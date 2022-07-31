import 'package:cycle_app/db/database_model.dart';
import 'package:cycle_app/model/training_data_model.dart';
import 'package:flutter/material.dart';

class TrainignDataPage extends StatelessWidget {
  TrainignDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TrainingData();
  }
}

class TrainingData extends StatefulWidget {
  TrainingData({Key? key}) : super(key: key);

  @override
  State<TrainingData> createState() => _TrainingDataState();
}

class _TrainingDataState extends State<TrainingData> {
  Training? tren_change_data;
  int? change_id;
  late Future<List<Training>> _trainingListFuture;
  List<Training>? _trainingList;
  String? title = "Тренировка";
  late String? description = "";
  late int? preparation = 0;
  late int? work = 0;
  late int? relax = 0;
  late int? cycle = 1;
  late int training_id;
  late bool isUpdate = false;

  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerPreparation = TextEditingController();
  final controllerWork = TextEditingController();
  final controllerRelax = TextEditingController();
  final controllerCycle = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateTrainingList();
  }

  updateTrainingList() {
    setState(() {
      _trainingListFuture = DBProvider.db.getTrainings();
    });
  }

  convert_data(int id) async {
    _trainingList = await _trainingListFuture;
    tren_change_data = _trainingList![id];
    if (isUpdate == true) {
      object_data_write();
    }
    print("ready");
  }

  updateList() {
    _trainingListFuture = DBProvider.db.getTrainings();
  }

  object_data_write() {
    controllerTitle.text = tren_change_data!.title;
    controllerDescription.text = tren_change_data!.description;
    controllerPreparation.text = tren_change_data!.preparation.toString();
    controllerWork.text = tren_change_data!.work.toString();
    controllerRelax.text = tren_change_data!.relax.toString();
    controllerCycle.text = tren_change_data!.cycle.toString();
  }

  @override
  Widget build(BuildContext context) {
    Object? set = ModalRoute.of(context)!.settings.arguments;
    if (set != null) {
      isUpdate = !isUpdate;
      change_id = set as int?;
      convert_data(change_id!);
      print(
          "Переданный id: ${change_id}, элемент ${_trainingList?[change_id as int].id} - ${_trainingList?[change_id as int].title} ");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.04),
        title: Row(
          children: [
            SizedBox(
              width: 200,
              child: Form(
                child: TextFormField(
                  controller: controllerTitle,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: "Название",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  onSaved: ((value) {
                    title = value!;
                  }),
                ),
              ),
            ),
            sizeBox(0, 24),
            ElevatedButton(
              onPressed: () {
                if (isUpdate) {
                  title = controllerTitle.text;
                  description = controllerDescription.text;
                  preparation = int.tryParse(controllerPreparation.text);
                  work = int.tryParse(controllerWork.text);
                  relax = int.tryParse(controllerRelax.text);
                  cycle = int.tryParse(controllerCycle.text);
                  DBProvider.db
                      .updateTraining(Training(change_id, title!, description!,
                          preparation!, work!, relax!, cycle!))
                      .then((value) {
                    setState(() {
                      isUpdate = false;
                    });
                  });
                } else {
                  title = controllerTitle.text;
                  description = controllerDescription.text;
                  preparation = int.tryParse(controllerPreparation.text);
                  work = int.tryParse(controllerWork.text);
                  relax = int.tryParse(controllerRelax.text);
                  cycle = int.tryParse(controllerCycle.text);

                  DBProvider.db.addTraining(Training(null, title!, description!,
                      preparation!, work!, relax!, cycle!));

                  print("training_added");
                }
                print("end_add");

                updateTrainingList();
                Navigator.of(context).pop();
              },
              child: Icon(Icons.check),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(
                      Colors.white.withOpacity(0.04))),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: MyInheritedWidget(
              myState: this,
              child: Column(
                children: [
                  Form(
                    child: TextFormField(
                      controller: controllerDescription,
                      decoration: const InputDecoration(
                          // icon: Icon(Icons.edit),
                          hintText: "Описание тренировки",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          enabledBorder: InputBorder.none),
                      onSaved: (value) {
                        description = value!;
                      },
                    ),
                  ),
                  Block(
                    name: "Подготовка",
                    controller: controllerPreparation,
                    isUpdate: isUpdate,
                  ),
                  Block(
                    name: "Работа",
                    controller: controllerWork,
                    isUpdate: isUpdate,
                  ),
                  Block(
                    name: "Отдых",
                    controller: controllerRelax,
                    isUpdate: isUpdate,
                  ),
                  Block(
                    name: "Цикл",
                    controller: controllerCycle,
                    isUpdate: isUpdate,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Block extends StatelessWidget {
  String name;
  bool isUpdate = false;
  late TextEditingController controller;
  Block(
      {Key? key,
      required this.name,
      required this.controller,
      required this.isUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myRootState = MyInheritedWidget.of(context)!.myState;
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
              Form(
                child: Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: (name != "Цикл" ? "0 секунд" : "0"),
                        enabledBorder: InputBorder.none),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    onSaved: (value) {
                      if (name == "Подготовка") {
                        myRootState!.description = value!;
                      } else if (name == "Работа") {
                        myRootState!.work = int.parse(value!);
                      } else if (name == "Отдых") {
                        myRootState!.relax = int.parse(value!);
                      } else if (name == "Цикл") {
                        myRootState!.cycle = int.parse(value!);
                      }
                    },
                  ),
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
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    ),
  );
}

Widget textFieldAppBar(String title) {
  return Form(
    child: TextFormField(
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: "Название тренировки",
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          suffixIcon: Icon(Icons.check),
          suffixIconColor: Colors.black),
      onSaved: ((value) {
        title = value!;
      }),
    ),
  );
}

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final _TrainingDataState? myState;

  MyInheritedWidget({Key? key, required this.child, @required this.myState})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return myState!._trainingListFuture !=
        oldWidget.myState!._trainingListFuture;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
