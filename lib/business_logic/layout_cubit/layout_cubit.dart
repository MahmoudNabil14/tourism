import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/presentation/screens/categories.dart';
import 'package:tourism/presentation/screens/more_screen.dart';
import 'package:tourism/presentation/screens/search_screen.dart';
import '../../presentation/screens/fav_screen.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(InitialState());

  static LayoutCubit get(context) {return BlocProvider.of(context);}

  int bottomNavCurrentIndex = 0;

  List screens = [
    Categories(),
    const SearchScreen(),
    const FavScreen(),
    const MoreScreen()
  ];

  List trips=[
    {
      "id":5,
      'name': "trip",
      "image": "   ",
      "isItFav":false
    },
    {
      "id":6,
      'name': "trip2",
      "image": "   ",
      "isItFav":false
    },
    {
      "id":7,
      'name': "trip3",
      "image": "   ",
      "isItFav":false
    },
    {
      "id":8,
      'name': "trip4",
      "image": "   ",
      "isItFav":false
    },
    {
      "id":9,
      'name': "trip6",
      "image": "   ",
      "isItFav":false
    },
    {
      "id":10,
      'name': "trip7",
      "image": "   ",
      "isItFav":false
    },];

  void changeBottomNav({required int index}){
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavIndex());
  }

  void changePasswordType({required Icon icon }){}

  void fav({required int index}){
    trips[index]['isItFav']=!trips[index]['isItFav'];
    emit(ChangeToFav());
  }
}