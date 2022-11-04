import 'package:flutter/material.dart';
import 'package:test_task_makeit/ui/widgets/button_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/Group.png'),
          const SizedBox(height: 54),
          const Text(
            'Не удалось загрузить информацию',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 73),
            child: TextButtonWidget(
              name: 'Обновить',
            ),
          )
        ],
      )),
    );
  }
}
