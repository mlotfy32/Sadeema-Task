import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/features/auth/signUp/domain/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register(String email, String password) async {
    final user = await registerUseCase(email, password);
  }
}
