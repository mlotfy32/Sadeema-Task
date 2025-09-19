import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getsystem/getsystem_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/view/widgets/stagesPage.dart';

class DetailesViewBody extends StatefulWidget {
  const DetailesViewBody({super.key});

  @override
  State<DetailesViewBody> createState() => _DetailesViewBodyState();
}

class _DetailesViewBodyState extends State<DetailesViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetsystemCubit>(context).getSystem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choose your education system',
                style: AppFonts.f16w400black.copyWith(fontSize: 22.sp),
              ),
              SizedBox(
                height: context.getHeight(context: context) - 120.h,
                child: BlocBuilder<GetsystemCubit, GetsystemState>(
                  builder: (context, state) {
                    if (state is GetsystemFailure) {
                      return Center(child: Text(state.error));
                    } else if (state is GetsystemSuccess) {
                      return Center(
                        child: SizedBox(
                          height: 150.h,
                          child: ListView.builder(
                            itemCount: state.systems.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await SharedPref.preferences.setString(
                                    PrefsKeys.systems,
                                    state.systems[index].name,
                                  );
                                  context.navigateTo(
                                    context: context,
                                    child: StagesPage(
                                      title: state.systems[index].name,
                                      stages: state.systems[index].stages,
                                    ),
                                  );
                                },
                                child: Text(state.systems[index].name),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: LoadingAnimationWidget.beat(
                        color: Colors.blue,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
