import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/di/service_locator.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/loginViewBody.dart';
import 'package:sadeema_task/features/auth/signUp/presentation/cubit/register/register_cubit.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: const Loginviewbody(isLogin: false),
    );
  }
}
