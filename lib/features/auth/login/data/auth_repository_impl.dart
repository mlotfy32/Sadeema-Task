import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sadeema_task/core/utiles/helper.dart';
import 'package:sadeema_task/features/auth/login/data/chaceLogin.dart';
import 'package:sadeema_task/features/auth/login/domain/auth_repository.dart';
import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class AuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl({fb.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance;

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Helper.FlutterToast(title: 'Success LogIn', success: true);
      //TODO:
      CachLogin.chacheLogin(
        accessToken: response.user!.uid,
        email: email,
        pass: password,
        signInMethod: 'email&password',
      );
      return UserEntity(
        userId: response.user!.uid,
        email: email,
        password: password,
      );
    } on fb.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Helper.FlutterToast(
          title: 'There is no user with this email.',
          success: false,
        );

        throw Exception();
      } else if (e.code == 'wrong-password') {
        Helper.FlutterToast(title: 'Incorrect password.', success: false);

        throw Exception();
      } else {
        Helper.FlutterToast(
          title: 'Something went wrong, please try again.',
          success: false,
        );

        throw Exception('Something went wrong, please try again.');
      }
    } catch (e) {
      Helper.FlutterToast(title: 'Unexpected error: $e', success: false);

      throw Exception();
    }
  }
}
