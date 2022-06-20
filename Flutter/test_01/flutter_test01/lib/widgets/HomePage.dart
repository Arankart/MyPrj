// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomaPage extends StatelessWidget {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.wifi, 'Подключения', ['Wi-fi', 'Bluetooth']),
    MenuRowData(Icons.south_rounded, 'Звуки и вибрации',
        ['Режим звука', 'Мелодия звонка']),
    MenuRowData(Icons.notification_important, 'Уведомления',
        ['Строка состояния', 'Не беспокоить']),
  ];
  final List<MenuRowData> secondMenuRow = [
    MenuRowData(
        Icons.display_settings, 'Дисплей', ['Яркость', 'Комфорт для глаз']),
    MenuRowData(Icons.wallpaper, 'Обои и стиль', ['Обои', 'Палитра цветов']),
    MenuRowData(Icons.brush, 'Темы', ['Главный экран', 'Обои']),
    MenuRowData(Icons.notification_important, 'Главный экран',
        ['Макет', 'Индикатор на значках']),
  ];

  HomaPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _NamePageWidget(),
              _MenuWidget(
                menuData: firstMenuRow,
              ),
              SizedBox(
                height: 16,
              ),
              _MenuWidget(
                menuData: secondMenuRow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData _icon;
  final String _text;
  List<String> shortDescription = [];

  MenuRowData(this._icon, this._text, this.shortDescription);
}

class _NamePageWidget extends StatelessWidget {
  const _NamePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 128),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Настройки',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        )
      ]),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuData;

  const _MenuWidget({
    Key? key,
    required this.menuData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children:
              menuData.map((data) => _MenuWidgetRow(data: data)).toList()),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  final double _font_size = 14.0;
  final double _title_size = 18.0;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              data._icon,
              size: 32,
              color: Colors.red,
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data._text,
                        style: TextStyle(fontSize: _title_size),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        data.shortDescription[0],
                        style:
                            TextStyle(fontSize: _font_size, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "•",
                        style:
                            TextStyle(fontSize: _font_size, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data.shortDescription[1],
                        style:
                            TextStyle(fontSize: _font_size, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 32,
              color: Colors.green,
            ),
          ],
        ));
  }
}
