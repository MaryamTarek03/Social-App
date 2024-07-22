part of 'app_manager_cubit.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitial extends AppManagerState {}


final class AppManagerChangePage extends AppManagerState {}

final class AppManagerChangeLang extends AppManagerState {}

final class AppManagerChangeTheme extends AppManagerState {}
