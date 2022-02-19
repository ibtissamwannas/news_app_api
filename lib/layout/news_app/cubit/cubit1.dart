import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/layout/news_app/cubit/state1.dart';
import 'package:news_app1/network/local/cache_helper.dart';

class NewsCubit1 extends Cubit<NewsStates1> {
  NewsCubit1() : super(NewsInitialState1());

  static NewsCubit1 get(context) => BlocProvider.of(context);

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(darkModeState());
    } else {
      isDark = !isDark;
    }
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(darkModeState());
    });
  }
}
