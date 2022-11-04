import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_makeit/cubit/user_state.dart';
import 'package:test_task_makeit/data/models/persons.dart';
import 'package:test_task_makeit/data/repositories/user_repository.dart';

part 'user_event.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepositories userRepositories;
  late final String errorMessage;
  late List<PersonEntity> users;
  UserCubit(this.userRepositories) : super(UserEmptyState()) {
    _initialize();
  }

  void _initialize() {
    emit(UserLoadingState());
  }

  void loadUserState() async {
    try {
      users = await userRepositories.getPersonsApi();
      emit(UserLaodedState(users: users));
    } catch (_) {
      _errorMessage(users as DioErrorType);
      emit(UserErrorState(errorMessage: errorMessage));
    }
  }

  String? _errorMessage(DioErrorType typeError) {
    switch (typeError) {
      case DioErrorType.connectTimeout:
        errorMessage = 'Запрос к серверу API был отменен';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Тайм-аут соединения с сервером API';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Тайм-аут получения в связи с сервером API';
        break;
      case DioErrorType.response:
        errorMessage = 'Упс! Что-то пошло не так';
        break;
      case DioErrorType.cancel:
        errorMessage = 'Тайм-автосвязь с сервером API';
        break;
      case DioErrorType.other:
        errorMessage = 'Произошла непредвиденная ошибка';
        break;
    }
    return null;
  }
}
