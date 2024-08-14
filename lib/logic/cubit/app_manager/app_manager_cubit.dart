import 'package:connect_social_app/config/constants/enums.dart';
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
  Language languageCode = Language.en;

  void setLanguage(Language newLanguage) {
    languageCode = newLanguage; // ! don't remove, code breaks :P
    language = Locale(languageCodes[languageCode]!);
    emit(AppManagerChangeLang());
  }

  MyTheme themeCode = MyTheme.original;
  void setTheme(MyTheme newTheme) {
    themeCode = newTheme;
    emit(AppManagerChangeTheme());
  }
  
  ThemeMode themeMode = ThemeMode.system;

  void toggleDarkMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(AppManagerToggleDarkMode());
  }
}
