import 'package:flutter/material.dart';
import 'package:test_task_makeit/ui/pages/auth_pages.dart';
import 'package:test_task_makeit/ui/widgets/error_widget.dart';
import 'package:test_task_makeit/ui/pages/main_page.dart';

abstract class MainNavigationRouteNames {
  static const authScreen = '/';
  static const mainScreen = '/main_screen';
  static const errorScreen = '/main_screen/errorpage';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.authScreen: (_) => const AuthPage(),
    MainNavigationRouteNames.mainScreen: (_) => const HomePage(),
    MainNavigationRouteNames.errorScreen: (_) => const ErrorPage(),
  };
}
