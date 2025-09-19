import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadeema_task/core/di/service_locator.dart';
import 'package:sadeema_task/core/utiles/7.1%20bloc_observer.dart';
import 'package:sadeema_task/core/utiles/checkInternetConnection.dart';
import 'package:sadeema_task/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:sadeema_task/core/utiles/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sadeema_task/features/home/data/cashCourseInfo/cashCource.dart';
import 'package:sadeema_task/features/saved/data/saveMode.dart';
import 'package:sadeema_task/features/search/data/local/hiveSearch.dart';
import 'package:sadeema_task/firebase_options.dart';
import 'package:sadeema_task/learning_app.dart';

List<String>? courcesChasedName;
bool? isLogin;
bool? detailes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SharedPref().instantiatePreferences();

  await Hive.initFlutter();
  Hive.registerAdapter(SearchModelAdapter());
  await Hive.openBox<SearchModel>(PrefsKeys.hiveSearch);

  Hive.registerAdapter(SaveModelAdapter());
  await Hive.openBox<SaveModel>(PrefsKeys.hiveSave);

  Hive.registerAdapter(CashCourceAdapter());
  await Hive.openBox<CashCource>(PrefsKeys.hiveCources);

  courcesChasedName =
      await SharedPref.preferences.getList(PrefsKeys.courcesChasedName) ?? [];

  await Checkinternetconnection().checkInternetConnection();
  await initDependencies();

  isLogin = await SharedPref.preferences.getBoolean(PrefsKeys.isLogin);
  detailes = await SharedPref.preferences.getBoolean(PrefsKeys.detailes);

  Bloc.observer = AppBlocObserver();

  runZonedGuarded(() {
    runApp(const LearningApp());
  }, (error, stackTrace) {});
}
