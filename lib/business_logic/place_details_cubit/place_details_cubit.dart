import 'package:flutter_bloc/flutter_bloc.dart';
import 'place_details_states.dart';

class Place_details_cubit extends Cubit<place_details_states> {
  Place_details_cubit({ required this.displayedimg}) : super(InitialState());

  static Place_details_cubit get(context) {
    return BlocProvider.of(context);
  }

     String displayedimg;

  void setDisplayed({required String image}){
    displayedimg=image;
    emit(SetimageState());
  }


}
