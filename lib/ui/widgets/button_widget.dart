import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_makeit/core/theme/app_colors.dart';
import 'package:test_task_makeit/cubit/user_cubit.dart';
import 'package:test_task_makeit/ui/navigation/navigation.dart';

class TextButtonWidget extends StatelessWidget {
  final String name;
  const TextButtonWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.read<UserCubit>();
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.baseColor,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
              color: AppColor.whiteColor.withOpacity(0.8),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        onPressed: () {
          userCubit.loadUserState();
          Navigator.of(context).pushNamedAndRemoveUntil(
              MainNavigationRouteNames.mainScreen, (route) => false);
        },
      ),
    );
  }
}
