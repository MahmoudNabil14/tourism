import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/presentation/screens/categories.dart';
import 'package:tourism/presentation/screens/more_screen.dart';
import 'package:tourism/presentation/screens/search_screen.dart';
import '../../presentation/screens/fav_screen.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) {
    return BlocProvider.of(context);
  }

  int bottomNavCurrentIndex = 0;

  List screens = [
    const Categories(),
    const SearchScreen(),
    const FavScreen(),
     MoreScreen()
  ];

  void changeBottomNav({required int index}) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavIndex());
  }

}
