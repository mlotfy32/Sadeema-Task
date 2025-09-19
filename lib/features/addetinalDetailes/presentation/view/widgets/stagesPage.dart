import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getclasses/getclasses_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/view/widgets/classesPage.dart';

class StagesPage extends StatelessWidget {
  const StagesPage({super.key, required this.stages, required this.title});
  final List<dynamic> stages;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Choose your education Stages',
              style: AppFonts.f16w400black.copyWith(fontSize: 22.sp),
            ),
            SizedBox(
              height: context.getHeight(context: context) - 120.h,
              child: ListView.builder(
                itemCount: stages.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      await SharedPref.preferences.setString(
                        PrefsKeys.stages,
                        stages[index]['name'],
                      );
                      Get.to(
                        () => BlocProvider<GetclassesCubit>(
                          create: (context) => GetclassesCubit(),
                          child: ClassesPage(id: stages[index]['id']),
                        ),
                      );
                    },
                    child: Text(stages[index]['name']),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
