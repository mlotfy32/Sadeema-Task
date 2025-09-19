import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/calling/callSystem.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/systemModel.dart';

part 'getsystem_state.dart';

class GetsystemCubit extends Cubit<GetsystemState> {
  GetsystemCubit() : super(GetsystemInitial());
  getSystem() async {
    final result = await CallSystem().getSystems();
    result.fold(
      (failure) {
        emit(GetsystemFailure(error: failure.message));
      },
      (success) {
        emit(GetsystemSuccess(systems: success));
      },
    );
  }
}
