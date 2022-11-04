import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_makeit/cubit/user_cubit.dart';
import 'package:test_task_makeit/data/repositories/user_repository.dart';
import 'package:test_task_makeit/ui/navigation/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(UserRepositories()),
      child: MaterialApp(
        title: 'Make It Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MainNavigationRouteNames.authScreen,
        routes: mainNavigation.routes,
      ),
    );
  }
}
