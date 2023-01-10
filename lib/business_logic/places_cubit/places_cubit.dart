import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'places_states.dart';

class PlacesCubit extends Cubit<PlacesStates> {
  PlacesCubit() : super(InitialState());

  static PlacesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Map<String, dynamic>> places = [];

  Future<void> getPlaces({required String categoryID}) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(categoryID)
        .collection('places')
        .get()
        .then((value) {
      places = [];
      for (var element in value.docs) {
        Map<String, dynamic> place = element.data();
        //to add category id to each category in the list
        place['placeId'] = element.id;
        place['categoryId'] = categoryID;
        places.add(place);
      }
      emit(GetPlacesSuccessState());
    }).catchError((error) {
      emit(GetPlacesErrorState());
    });
  }

  void fav({
    required int index,
  }) async {
    places[index]['isItFav'] = !places[index]['isItFav'];

    FirebaseFirestore.instance
        .collection("categories")
        .doc(places[index]["categoryId"])
        .collection("places")
        .doc(places[index]['placeId'])
        .update({"isItFav": places[index]['isItFav']});
    emit(ChangeToFav());
  }
}
