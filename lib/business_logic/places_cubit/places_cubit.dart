import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'places_states.dart';

class PlacesCubit extends Cubit<PlacesStates> {
  PlacesCubit() : super(InitialState());

  static PlacesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Map<String, dynamic>> categoryPlaces = [];
  List<Map<String, dynamic>> allPlaces = [];

  Future<void> getCategoryPlaces({required String categoryID}) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(categoryID)
        .collection('places')
        .get()
        .then((value) {
      categoryPlaces = [];
      for (var element in value.docs) {
        Map<String, dynamic> place = element.data();
        //to add category id to each category in the list
        place['placeId'] = element.id;
        place['categoryId'] = categoryID;
        categoryPlaces.add(place);
      }
      emit(GetCategoryPlacesSuccessState());
    }).catchError((error) {
      emit(GetCategoryPlacesErrorState());
    });
  }

  Future<void> getAllPlaces() async {
    emit(GetAllPlacesLoadingState());
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((categoriesList)async {
          for(var category in categoriesList.docs) {
            await FirebaseFirestore.instance
                .collection('categories')
                .doc(category.id)
                .collection('places')
                .get().then((categoryPlaces){
              for (var element in categoryPlaces.docs) {
                Map<String, dynamic> place = element.data();
                place['placeId'] = element.id;
                place['categoryId'] = element.id;
                allPlaces.add(place);
              }
            });
          }
      emit(GetAllPlacesSuccessState());
    }).catchError((error) {
      emit(GetAllPlacesErrorState());
    });
  }

  void fav({
    required int index,
  }) async {
    categoryPlaces[index]['isItFav'] = !categoryPlaces[index]['isItFav'];

    FirebaseFirestore.instance
        .collection("categories")
        .doc(categoryPlaces[index]["categoryId"])
        .collection("places")
        .doc(categoryPlaces[index]['placeId'])
        .update({"isItFav": categoryPlaces[index]['isItFav']});
    emit(ChangeToFav());
  }
}
