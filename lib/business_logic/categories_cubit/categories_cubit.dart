import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit():super(InitialState());

  static CategoriesCubit get(context) {return BlocProvider.of(context);}

  List categories=[];

  Future<void> getCategories()async{
    await FirebaseFirestore.instance.collection('categories').get().then((value) {
      for (var category in value.docs){
        print("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${category.data()}");
        categories.add(category.data());
      }
      emit(GetCategoriesSuccessState());
    }).catchError((error){
      emit(GetCategoriesErrorState());
    });
  }
}