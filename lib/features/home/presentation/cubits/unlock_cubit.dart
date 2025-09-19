import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:sadeema_task/main.dart';

part 'unlock_state.dart';

class UnlockCubit extends Cubit<UnlockState> {
  UnlockCubit() : super(UnlockInitial());
  var cources = courcesChasedName;

  getCourcesList({required String courceName}) async {
    log('Before emit : $cources');

    List<String>? courcesChased = await SharedPref.preferences.getList(
      PrefsKeys.courcesChasedName,
    );
    cources = courcesChased == null ? [] : courcesChased;
    cources!.add(courceName);
    emit(Unlock(cources: cources));

    log('After emit : $cources');
  }
}
