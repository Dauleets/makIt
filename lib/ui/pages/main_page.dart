import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_makeit/core/theme/app_colors.dart';
import 'package:test_task_makeit/cubit/user_cubit.dart';
import 'package:test_task_makeit/cubit/user_state.dart';
import 'package:test_task_makeit/ui/navigation/navigation.dart';
import 'package:test_task_makeit/ui/widgets/error_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        leadingWidth: 0,
        scrolledUnderElevation: 5.0,
        toolbarHeight: 50,
        title: const Text(
          'Пользователи',
          style: TextStyle(color: AppColor.blackColor, fontSize: 28),
          textAlign: TextAlign.start,
        ),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 13, right: 21, top: 20),
        child: UserList(),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLaodedState) {
          return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        MainNavigationRouteNames.errorScreen, (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 80,
                    child: ListTile(
                      leading: const Icon(
                        CupertinoIcons.person_circle,
                        color: Color(0xffCCCCCC),
                        size: 50,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              state.users[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              state.users[index].email,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(164, 80, 80, 80),
                              ),
                            ),
                            const Text(
                              "Surf",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }

        if (state is UserErrorState) {
          return const ErrorPage();
        }

        if (state is UserLoadingState) {
          return Center(
              child: CircularProgressIndicator(color: AppColor.baseColor));
        }

        return const Center(
          child: Text(
            'Что то пошло не так..',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
