import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/calling/callTerm.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/classroomsModel.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/termModel.dart';

part 'getterm_state.dart';

class GettermCubit extends Cubit<GettermState> {
  GettermCubit() : super(GettermInitial());

  getTerm({required int id}) async {
    emit(GettermLoading());
    final result = await CallTerm().getClasses(id: id);
    result.fold(
      (failure) {
        emit(GettermFailure(error: failure.message));
      },
      (success) {
        emit(GettermSuccess(terms: success));
      },
    );
  }
}
