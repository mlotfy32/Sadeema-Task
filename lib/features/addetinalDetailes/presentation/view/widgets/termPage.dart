import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getclasses/getclasses_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getterm/getterm_cubit.dart';
import 'package:sadeema_task/features/home/presentation/view/homeView.dart';

class TermPage extends StatefulWidget {
  const TermPage({super.key, required this.id});
  final int id;
  @override
  State<TermPage> createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  @override
  void initState() {
    BlocProvider.of<GettermCubit>(context).getTerm(id: widget.id);
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
                'Choose your Term',
                style: AppFonts.f16w400black.copyWith(fontSize: 22.sp),
              ),
              BlocBuilder<GettermCubit, GettermState>(
                builder: (context, state) {
                  if (state is GettermFailure) {
                    return Center(child: Text(state.error));
                  } else if (state is GettermSuccess) {
                    return Center(
                      child: SizedBox(
                        height: context.getHeight(context: context) - 100.h,
                        child: ListView.builder(
                          itemCount: state.terms.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await SharedPref.preferences.setString(
                                  PrefsKeys.terms,
                                  state.terms[index].name,
                                );
                                await SharedPref.preferences.setBoolean(
                                  PrefsKeys.detailes,
                                  true,
                                );
                                Get.offAll(() => const Homeview());
                              },
                              child: Text(state.terms[index].name),
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
            ],
          ),
        ),
      ),
    );
  }
}
