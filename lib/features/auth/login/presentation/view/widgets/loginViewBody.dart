import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/style/appImages/appImages.dart';
import 'package:sadeema_task/core/utiles/widgets/3.1%20animate_do.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/login/login_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/customeClip.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/loginContainer.dart';
import 'package:sadeema_task/features/auth/signUp/presentation/cubit/register/register_cubit.dart';

class Loginviewbody extends StatefulWidget {
  const Loginviewbody({super.key, required this.isLogin});
  final bool isLogin;
  @override
  State<Loginviewbody> createState() => _LoginviewbodyState();
}

class _LoginviewbodyState extends State<Loginviewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomFadeInDown(
              duration: 1000,
              child: Column(
                children: [
                  SizedBox(
                    height: context.getHeight(context: context),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: context.getHeight(context: context) / 3,
                          ),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Appimages.loginBacGround),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: context.getHeight(context: context) / 2.2,
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: double.infinity,
                          child: LogInContainerBody(
                            isLogin: widget.isLogin,
                            email: email,
                            pass: pass,
                            confirmPass: confirmPass,
                            formKey: formKey,
                          ),
                        ),
                        const Spacer(),
                        CustomFadeInUp(
                          duration: 2000,
                          child: CustomeClip(
                            isLogin: widget.isLogin,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                widget.isLogin
                                    ? BlocProvider.of<LoginCubit>(
                                        context,
                                      ).loginWithEmail(email.text, pass.text)
                                    : BlocProvider.of<RegisterCubit>(
                                        context,
                                      ).register(email.text, pass.text);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
