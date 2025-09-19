import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/features/home/presentation/cubits/cources/cources_cubit.dart';
import 'package:sadeema_task/features/search/presentation/cubits/gethistory/gethistory_cubit.dart';
import 'package:sadeema_task/features/search/presentation/view/widgets/searchViewBody.dart';

class Searchtap extends StatelessWidget {
  const Searchtap({super.key});

  @override
  Widget build(BuildContext context) {
    //GethistoryCubit
    //
    return MultiBlocProvider(
      providers: [
        BlocProvider<GethistoryCubit>(create: (context) => GethistoryCubit()),
        BlocProvider<CourcesCubit>(create: (context) => CourcesCubit()),
      ],
      child: const Searchviewbody(),
    );
  }
}
