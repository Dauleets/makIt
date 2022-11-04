import 'package:flutter/material.dart';

import 'package:test_task_makeit/core/theme/app_colors.dart';
import 'package:test_task_makeit/ui/widgets/button_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Positioned(
              left: -constraints.maxWidth * .1,
              right: -constraints.maxWidth * .1,
              top: constraints.maxHeight * .0,
              child: Image.asset(
                "assets/image/bg.png",
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
                left: 25,
                top: 185,
                child: Text(
                  'Вход',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: AppColor.whiteColor),
                )),
            const AuthFieldWidget()
          ],
        ),
      ),
    );
  }
}

class AuthFieldWidget extends StatelessWidget {
  const AuthFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.only(left: 48, right: 48),
        decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: AppColor.blackColor,
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: -10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 45),
            AuthTextFieldWidget(text: 'Email', obscureText: false),
            SizedBox(height: 30),
            AuthTextFieldWidget(text: 'Пароль', obscureText: true),
            SizedBox(height: 30),
            TextButtonWidget(
              name: 'Войти',
            ),
            SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}

class AuthTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String text;
  const AuthTextFieldWidget(
      {this.obscureText = false, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(color: AppColor.baseColor),
      controller: TextEditingController(),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        focusColor: AppColor.baseColor,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.baseColor!,
          ),
        ),
      ),
    );
  }
}
