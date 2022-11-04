import 'package:test_task_makeit/data/models/persons.dart';

abstract class UserState {}

class UserLaodedState extends UserState {
  List<PersonEntity> users;
  UserLaodedState({required this.users});
}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {
  final String errorMessage;
  UserErrorState({
    required this.errorMessage,
  });
}
