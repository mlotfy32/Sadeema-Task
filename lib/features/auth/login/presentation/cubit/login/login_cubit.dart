import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/features/auth/login/domain/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> loginWithEmail(String email, String password) async {
    final user = await loginUseCase.callEmailAuth(email, password);
  }
}
