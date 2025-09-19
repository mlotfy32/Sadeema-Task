import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeema_task/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:sadeema_task/core/utiles/widgets/3.1%20animate_do.dart';
import 'package:sadeema_task/features/auth/login/presentation/viewModel/passwordvisability/passwordvisability_cubit.dart';
import 'package:sadeema_task/features/auth/login/presentation/view/widgets/customeLoginForm.dart';

class LogInContainerBody extends StatefulWidget {
  const LogInContainerBody({
    super.key,
    required this.email,
    required this.pass,
    this.formKey,
  });
  final TextEditingController email;
  final TextEditingController pass;
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

              'signed in!',
              style: AppFonts.f30w600black,
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: BlocProvider<PasswordvisabilityCubit>(
            create: (context) => PasswordvisabilityCubit(),
            child: CustomeLoginForm(
              email: widget.email,
              pass: widget.pass,
              formKey: widget.formKey,
            ),
          ),
        ),
      ],
    );
  }
}
