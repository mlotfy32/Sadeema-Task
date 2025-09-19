import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sadeema_task/core/utiles/style/appImages/appImages.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/home/presentation/cubits/cashcources/cashcources_cubit.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/customAppBar.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/customCourcesList.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/suggestCources.dart';
import 'package:sadeema_task/features/saved/presentation/cubits/save/save_cubit.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        BlocProvider<CashcourcesCubit>(
          create: (context) => CashcourcesCubit(),
          child: const CustomAppBar(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Choose your',
                      textStyle: AppFonts.f25w500white,
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Course',
                      textStyle: AppFonts.f25w500white,
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            SizedBox(
              width: 80,
              height: 70,
              child: Lottie.asset(Appimages.welcome),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SuggestCources(),
        const SizedBox(height: 15),
        BlocProvider<SaveCubit>(
          create: (context) => SaveCubit(),
          child: const Customcourceslist(),
        ),
      ],
    );
  }
}
