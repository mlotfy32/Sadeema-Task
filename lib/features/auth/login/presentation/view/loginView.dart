import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/di/service_locator.dart';
import 'package:sadeema_task/features/auth/login/domain/login_usecase.dart';
import 'package:sadeema_task/features/auth/login/presentation/viewModel/login/login_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/loginViewBody.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const Loginviewbody(),
    );
  }
}
