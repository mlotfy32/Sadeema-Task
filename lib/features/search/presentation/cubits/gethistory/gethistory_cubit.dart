import 'package:bloc/bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/features/search/data/local/hiveSearch.dart';

part 'gethistory_state.dart';

class GethistoryCubit extends Cubit<GethistoryState> {
  GethistoryCubit() : super(GethistoryInitial());

  getHistory() async {
    emit(GethistoryLoading());
    Box<SearchModel> searchModel = await Hive.box(PrefsKeys.hiveSearch);
    try {
      List<SearchModel> history = await searchModel.values.toList();
      if (history.isEmpty) {
        emit(GethistoryEmpty());
      } else {
        emit(GethistorySuccess(history: history.reversed.toList()));
      }
    } catch (e) {
      emit(GethistoryFailure(error: e.toString()));
    }
  }

  addToHistory({required SearchModel search}) async {
    Box<SearchModel> searchModel = await Hive.box(PrefsKeys.hiveSearch);
    searchModel.add(search);
  }
}
