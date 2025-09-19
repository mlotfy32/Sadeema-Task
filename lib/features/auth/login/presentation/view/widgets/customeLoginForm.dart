import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadeema_task/core/di/service_locator.dart';
import 'package:sadeema_task/core/utiles/style/appImages/appImages.dart';
import 'package:sadeema_task/core/utiles/widgets/3.1%20animate_do.dart';
import 'package:sadeema_task/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/login/login_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/passwordvisability/passwordvisability_cubit.dart';

class CustomeLoginForm extends StatelessWidget {
  const CustomeLoginForm({
    super.key,
    required this.email,
    required this.pass,
    required this.formKey,
    required this.isLogin,
    required this.confirmPass,
  });
  final TextEditingController email;
  final TextEditingController pass;
  final TextEditingController confirmPass;
  final formKey;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    bool isVisable = true;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 5),
        child: Column(
          children: [
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'email is required';
                } else if (value.contains('@gmail.com') == false) {
                  return 'invalid email';
                }
                return null;
              },
              controller: email,
              hintText: 'email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.h),
            BlocBuilder<PasswordvisabilityCubit, PasswordvisabilityState>(
              builder: (context, state) {
                isVisable = state is Passwordvisability
                    ? state.isPasswordVisible
                    : isVisable;
                return Column(
                  children: [
                    CustomTextField(
                      controller: pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password is required';
                        } else if (value.length < 8) {
                          return 'password can`t be less than 8 letters';
                        }
                        return null;
                      },
                      hintText: 'password',
                      obscureText: isVisable,
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<PasswordvisabilityCubit>(
                            context,
                          ).changeVisability(isVisable: !isVisable);
                        },
                        icon: Icon(
                          size: 20,
                          state is Passwordvisability &&
                                  state.isPasswordVisible == false
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: const Color(0xff757575),
                        ),
                      ),
                    ),

                    isLogin
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomTextField(
                              controller: confirmPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password is required';
                                } else if (value != pass.text) {
                                  return 'password not match';
                                }
                                return null;
                              },
                              hintText: 'confirm password',
                              obscureText: isVisable,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<PasswordvisabilityCubit>(
                                    context,
                                  ).changeVisability(isVisable: !isVisable);
                                },
                                icon: Icon(
                                  size: 20,
                                  state is Passwordvisability &&
                                          state.isPasswordVisible == false
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: const Color(0xff757575),
                                ),
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
