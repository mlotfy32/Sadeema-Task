import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/appImages/appImages.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/home/presentation/cubits/cashcources/cashcources_cubit.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/circleIcon.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/courcesChart.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/userDetailes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Appimages.appLogo, width: 40, height: 40),
        const Spacer(),
        InkWell(
          onTap: () {
            context.navigateTo(
              context: context,
              child: BlocProvider<CashcourcesCubit>(
                create: (context) => CashcourcesCubit(),
                child: CourcesChart(),
              ),
            );
          },
          child: Circleicon(url: Appimages.homeAppBar.first),
        ),

        InkWell(
          onTap: () =>
              context.navigateTo(context: context, child: UserDetailes()),
          child: Circleicon(url: Appimages.homeAppBar.last),
        ),
      ],
    );
  }
}
