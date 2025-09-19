import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/di/service_locator.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/login/login_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/loginViewBody.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const Loginviewbody(isLogin: true),
    );
  }
}
