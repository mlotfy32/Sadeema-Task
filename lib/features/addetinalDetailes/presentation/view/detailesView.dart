import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getsystem/getsystem_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/view/widgets/detailesViewBody.dart';

class DetailesView extends StatelessWidget {
  const DetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetsystemCubit>(
      create: (context) => GetsystemCubit(),
      child: const DetailesViewBody(),
    );
  }
}
