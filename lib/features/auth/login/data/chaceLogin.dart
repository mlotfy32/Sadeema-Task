import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sadeema_task/core/utiles/helper.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/features/addetinalDetailes/presentation/view/detailesView.dart';

class CachLogin {
  factory CachLogin() {
    return _instance;
  }
  CachLogin._internal();
  static final CachLogin _instance = CachLogin._internal();
  static chacheLogin({
    required String? accessToken,
    required int userId,
    required String emailorephone,
    required String userName,
    required String type,
  }) async {
    Helper.customeLoadingwidget(size: 50);
    await SharedPref.preferences.setString(PrefsKeys.accessToken, accessToken!);
    await SharedPref.preferences.setString(PrefsKeys.email, emailorephone);
    await SharedPref.preferences.setString(PrefsKeys.userName, userName);
    await SharedPref.preferences.setString(PrefsKeys.type, type);
    await SharedPref.preferences.setInt(PrefsKeys.userId, userId);

    await SharedPref.preferences.setBoolean(PrefsKeys.isLogin, true);
    Get.back();
    Helper.FlutterToast(title: 'Success Login', success: true);
    Get.off(() => const DetailesView());
  }
}
