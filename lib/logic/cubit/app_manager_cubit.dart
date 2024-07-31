import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerInitial());

  static AppManagerCubit get(context) => BlocProvider.of(context);

  int selectedPageIndex = 0;

  void setSelectedPageIndex(int index) {
    if (selectedPageIndex == index) {
      selectedPageIndex = 0;
    } else {
      selectedPageIndex = index;
    }
    emit(AppManagerChangePage());
  }

  Locale language = const Locale('en');
  Alignment stackAlignment = Alignment.topLeft;

  void toggleLanguage() {
    language = language == const Locale('en')
        ? const Locale('ar')
        : const Locale('en');
    stackAlignment =
        language == const Locale('en') ? Alignment.topLeft : Alignment.topRight;
    emit(AppManagerChangeLang());
  }

  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(AppManagerChangeTheme());
  }
}
