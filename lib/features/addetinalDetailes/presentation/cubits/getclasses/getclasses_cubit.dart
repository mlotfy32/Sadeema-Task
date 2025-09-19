import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/calling/callClasses.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/classroomsModel.dart';

part 'getclasses_state.dart';

class GetclassesCubit extends Cubit<GetclassesState> {
  GetclassesCubit() : super(GetclassesInitial());
  getClasses({required int id}) async {
    emit(GetclassesLoading());
    final result = await CallClasses().getClasses(id: id);
    result.fold(
      (failure) {
        emit(GetclassesFailure(error: failure.message));
      },
      (success) {
        emit(GetclassesSuccess(classes: success));
      },
    );
  }
}
