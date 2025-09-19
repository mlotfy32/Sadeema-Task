import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/home/presentation/view/widgets/courcesDays.dart';

class Courceslist extends StatelessWidget {
  const Courceslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 70,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  textAlign: TextAlign.center,
                  'Learning Languages For Beginners',
                  textStyle: AppFonts.f25w500white,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          SizedBox(
            height: context.getHeight(context: context) - 100,
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: courcesImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 236.h,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CourceDays(courceName: courcesName[index]));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: context.getWidth(context: context) / 1.5,
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          color: Colors.white60,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: context.getWidth(context: context) / 1.5,
                          height: 220,
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(courcesImages[index]),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                          ),
                        ),
                        Text(
                          ' ${courcesName[index]}',
                          style: AppFonts.f17w500white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> courcesImages = [
  'https://media.istockphoto.com/id/953264308/photo/learn-english-note-at-wooden-background-with-teachers-glasses.jpg?s=612x612&w=0&k=20&c=S2fmg6b_1CrCwzsGKP_YxVaGA0jHYAyxbJfHvnORFlQ=',
];
List<String> courcesName = ['English Cource For Beginners'];
