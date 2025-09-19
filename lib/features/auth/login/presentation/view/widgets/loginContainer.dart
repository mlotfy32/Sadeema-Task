import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/utiles/extentions/extentions.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/core/utiles/widgets/3.1%20animate_do.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/passwordvisability/passwordvisability_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/customeLoginForm.dart';
import 'package:sadeema_task/features/auth/signUp/presentation/view/signUpView.dart';

class LogInContainerBody extends StatefulWidget {
  const LogInContainerBody({
    super.key,
    required this.isLogin,
    required this.email,
    required this.pass,
    required this.confirmPass,
    this.formKey,
  });
  final bool isLogin;
  final TextEditingController email;
  final TextEditingController pass;
  final TextEditingController confirmPass;
  final formKey;

  @override
  State<LogInContainerBody> createState() => _LogInContainerBodyState();
}

class _LogInContainerBodyState extends State<LogInContainerBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(
          child: CustomFadeInDown(
            duration: 1000,
            child: Text(
              'Let`s get your',
              style: AppFonts.f30w600black,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFadeInDown(
            duration: 2000,

            child: Text(
              textAlign: TextAlign.center,

              widget.isLogin == true ? 'signed in!' : 'signed up!',
              style: AppFonts.f30w600black,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.isLogin == true
                    ? 'You don`t have an account yet?'
                    : 'already have an account',
                style: AppFonts.f16w400gray,
              ),
              TextButton(
                onPressed: () {
                  widget.isLogin
                      ? context.navigateTo(
                          context: context,
                          child: const Signupview(),
                        )
                      : context.navigateBack(context: context);
                },
                child: Text(widget.isLogin == true ? 'Sign Up' : 'Sign In'),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocProvider<PasswordvisabilityCubit>(
            create: (context) => PasswordvisabilityCubit(),
            child: CustomeLoginForm(
              isLogin: widget.isLogin,
              email: widget.email,
              pass: widget.pass,
              confirmPass: widget.confirmPass,
              formKey: widget.formKey,
            ),
          ),
        ),
      ],
    );
  }
}
