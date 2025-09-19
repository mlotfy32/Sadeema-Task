import 'package:flutter/material.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';

class UserDetailes extends StatelessWidget {
  UserDetailes({super.key});
  List<String> userData = [];
  @override
  Widget build(BuildContext context) {
    getUserData();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'User Data',
                style: AppFonts.f25w500white,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.getHeight(context: context) / 3,
                child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) => ListTile(
                    trailing: Text(
                      userData[index],
                      style: AppFonts.f17w500white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getUserData() async {
    userData.add(SharedPref.preferences.getString(PrefsKeys.systems)!);
    userData.add(SharedPref.preferences.getString(PrefsKeys.stages)!);
    userData.add(SharedPref.preferences.getString(PrefsKeys.classes)!);
    userData.add(SharedPref.preferences.getString(PrefsKeys.terms)!);
  }
}
