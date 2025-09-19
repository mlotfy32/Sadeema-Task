import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getclasses/getclasses_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/cubits/getterm/getterm_cubit.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/view/widgets/termPage.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key, required this.id});
  final int id;
  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  void initState() {
    BlocProvider.of<GetclassesCubit>(context).getClasses(id: widget.id);
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
                'Choose your Class Room',
                style: AppFonts.f16w400black.copyWith(fontSize: 22.sp),
              ),
              BlocBuilder<GetclassesCubit, GetclassesState>(
                builder: (context, state) {
                  if (state is GetclassesFailure) {
                    return Center(child: Text(state.error));
                  } else if (state is GetclassesSuccess) {
                    return Center(
                      child: SizedBox(
                        height: context.getHeight(context: context) - 100.h,
                        child: ListView.builder(
                          itemCount: state.classes.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await SharedPref.preferences.setString(
                                  PrefsKeys.classes,
                                  state.classes[index].name,
                                );
                                context.navigateTo(
                                  context: context,
                                  child: BlocProvider<GettermCubit>(
                                    create: (context) => GettermCubit(),
                                    child: TermPage(
                                      id: state.classes[index].id,
                                    ),
                                  ),
                                );
                              },
                              child: Text(state.classes[index].name),
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
