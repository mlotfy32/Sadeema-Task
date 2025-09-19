import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>? courcesChasedName = SharedPref.preferences.getList(
      PrefsKeys.courcesChasedName,
    );
    courcesChasedName = courcesChasedName == null ? [] : courcesChasedName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              textAlign: TextAlign.center,
              'Track your progress',
              textStyle: AppFonts.f25w500white,
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        SizedBox(
          height: context.getHeight(context: context) / 4 + 30,

          child: GridView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: context.getHeight(context: context) / 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: index == 0
                    ? const Color(0xffFFFE7C2D)
                    : const Color(0xffFF2D2D2D),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.access_alarm_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        index == 0
                            ? getTime()
                            : '${courcesChasedName!.length} courses',
                        style: AppFonts.f30w600black.copyWith(
                          fontSize: 25,
                          color: index == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    index == 0 ? 'Total Watched Time' : 'viewed',
                    style: AppFonts.f16w400black.copyWith(
                      color: index == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  getTime() {
    String? time = SharedPref.sharedPreferences.getString('totalCourcesTime');
    if (time == null)
      return '0';
    else
      return time;
  }
}
