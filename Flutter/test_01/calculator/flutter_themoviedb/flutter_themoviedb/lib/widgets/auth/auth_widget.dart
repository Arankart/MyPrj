import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_themoviedb/theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Страница авторизации"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              _FormWidget(),
              _HeaderWidget()
            ],
          ),
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  final style = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          "Рыбатекст используется дизайнерами, проектировщиками и фронтендерами, когда нужно быстро заполнить макеты или прототипы содержимым.",
          style: style,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: AppButtonStyle.linkButton,
          onPressed: () {},
          child: Text(
            "Регистрация",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "Это тестовый контент, который не должен нести никакого смысла, лишь показать наличие самого текста или продемонстрировать типографику в деле.",
          style: style,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: AppButtonStyle.linkButton,
          onPressed: () {},
          child: Text("Подверждение почты", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  String? errorText = null;

  final _authTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _auth() {
    final login = _authTextController.text;
    final password = _passwordTextController.text;

    if (login == "admin" && password == "admin") {
      print("open app");
      errorText = null;
    } else {
      errorText = "Не верный логин или пароль";
    }
    setState(() {});
  }

  void _resetPassword() {
    print("Сброс пароля");
  }

  final buttonColor = const Color.fromRGBO(43, 45, 66, 1);

  final style = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2);

  final formTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  final decorator = const InputDecoration(
      border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0));

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
        ],
        Text(
          "Логин",
          style: style,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _authTextController,
          style: formTextStyle,
          decoration: decorator,
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "Пароль",
          style: style,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _passwordTextController,
          style: formTextStyle,
          decoration: decorator,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(120.0, 20.0)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(43, 45, 66, 1)),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: _auth,
                child: Text(
                  "Войти",
                  style: TextStyle(fontSize: 18.0),
                )),
            SizedBox(
              width: 15,
            ),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: _resetPassword,
                child: Text(
                  "Восстановить пароль",
                  style: TextStyle(fontSize: 18.0),
                )),
          ],
        )
      ],
    );
  }
}
