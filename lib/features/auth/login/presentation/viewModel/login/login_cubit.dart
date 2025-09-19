import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/core/utiles/helper.dart';
import 'package:sadeema_task/features/auth/login/data/auth_repository_impl.dart';
import 'package:sadeema_task/features/auth/login/data/chaceLogin.dart';
import 'package:sadeema_task/features/auth/login/data/models/successLoginModel.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // final LoginUseCase loginUseCase;

  LoginCubit() : super(LoginInitial());

  Future<void> loginWithEmail(String email, String password) async {
    Map<String, String> deviceData = await getDeviceInfo();
    final user = await AuthRemoteDataSourceImpl().login(
      emailOrPhone: email,
      password: password,
      type: 'parent',
      mobileId: deviceData['deviceId']!,
      mobileType: deviceData['deviceModel']!,
      notiId: 'notification_token_123',
    );
    user.fold(
      (failure) {
        Helper.FlutterToast(title: failure.message, success: false);
        emit(LoginFailure(errorMessage: failure.message));
      },
      (success) {
        String emailOrPhone = success.email == 'not found'
            ? success.phone
            : success.email;
        CachLogin.chacheLogin(
          accessToken: success.token,
          userId: success.id,
          emailorephone: emailOrPhone,
          userName: success.username,
          type: success.type,
        );
        emit(LoginSuccess(successLoginModel: success));
      },
    );
  }
}

Future<Map<String, String>> getDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  String deviceModel = 'Unknown';
  String deviceId = 'Unknown';

  try {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceModel = 'android';
      deviceId = androidInfo.id ?? 'Unknown';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceModel = 'ios';
      deviceId = iosInfo.identifierForVendor ?? 'Unknown';
    }
  } catch (e) {
    deviceModel = 'Error';
    deviceId = 'Error';
  }

  return {'deviceModel': deviceModel, 'deviceId': deviceId};
}
