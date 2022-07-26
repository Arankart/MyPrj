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
  late Future<List<Training>> _trainingList;
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
      _trainingList = DBProvider.db.getTrainings();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  DBProvider.db
                      .updateTraining(Training(training_id, title!,
                          description!, preparation!, work!, relax!, cycle!))
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
                  Block(name: "Подготовка", controller: controllerPreparation),
                  Block(name: "Работа", controller: controllerWork),
                  Block(name: "Отдых", controller: controllerRelax),
                  Block(name: "Цикл", controller: controllerCycle),
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
  late TextEditingController controller;
  Block({Key? key, required this.name, required this.controller})
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
                    decoration: const InputDecoration(
                        hintText: "0", enabledBorder: InputBorder.none),
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

// Widget descriptionFunc() {
//   return Form(
//     child: TextFormField(
//       decoration: const InputDecoration(
//           // icon: Icon(Icons.edit),
//           hintText: "Описание тренировки",
//           hintStyle: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
//           enabledBorder: InputBorder.none),
//       onSaved: (value) {
//         myRootState = value!;
//       },
//     ),
//   );
// }

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
    return myState!._trainingList != oldWidget.myState!._trainingList;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
