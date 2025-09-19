import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:get/get.dart';
import 'package:sadeema_task/core/utiles/helper.dart';
import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';
import 'package:sadeema_task/features/auth/signUp/domain/auth_register_repository.dart';

class AuthRegisterRepositoryImpl implements AuthRegisterRepository {
  final fb.FirebaseAuth _firebaseAuth;

  AuthRegisterRepositoryImpl({fb.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance;

  @override
  Future<UserEntity?> register(String email, String password) async {
    Helper.customeLoadingwidget(size: 60);
    try {
      await fb.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Helper.FlutterToast(
        title: 'Account Created Successfully Let`s Login',
        success: true,
      );
      Get.back();
    } on fb.FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'weak-password') {
        Helper.FlutterToast(
          title: 'The password provided is too weak.',
          success: false,
        );
      } else if (e.code == 'email-already-in-use') {
        Helper.FlutterToast(
          title: 'The account already exists for that email.',
          success: false,
        );
      } else {
        Helper.FlutterToast(
          title: 'Something went wrong please try again.',
          success: false,
        );
      }
    } catch (e) {
      Get.back();
      Helper.FlutterToast(
        title: 'Something went wrong please try again.',
        success: false,
      );
    }
  }
}



/*

    }
*/