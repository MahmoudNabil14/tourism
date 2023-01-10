import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(InitialState());

  static CategoriesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Map<String, dynamic>> categories = [];

  Future<void> getCategories() async {
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((value) {
      categories = [];
      for (var element in value.docs) {
        Map<String, dynamic> category = element.data();
        //to add category id to each category in the list
        category['categoryId'] = element.id;
        categories.add(category);
      }
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      emit(GetCategoriesErrorState());
    });
  }
}
