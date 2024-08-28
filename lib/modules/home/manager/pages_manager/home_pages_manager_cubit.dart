import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_pages_manager_state.dart';

class HomePagesManagerCubit extends Cubit<HomePagesManagerState> {
  HomePagesManagerCubit() : super(HomePagesManagerInitial());
  static HomePagesManagerCubit get(context) => BlocProvider.of(context);
  int selectedPageIndex = 0;

  void setSelectedPageIndex(int index) {
    if (selectedPageIndex == index) {
      selectedPageIndex = 0;
    } else {
      selectedPageIndex = index;
    }
    emit(HomePagesManagerChangePage());
  }
}
