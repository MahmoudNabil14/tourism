import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourites_states.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  FavouritesCubit() : super(InitialState());

  static FavouritesCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Map<String, dynamic>> favourites = [];

  Future<void> getFavourites() async {
    emit(GetFavouritesLoadingState());
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((value) async {
      for (var category in value.docs) {
        await FirebaseFirestore.instance
            .collection('categories')
            .doc(category.id)
            .collection('places')
            .get()
            .then((places) {
          for (var place in places.docs) {
            if (place.data()['isItFav']) {
              Map<String, dynamic> element = place.data();
              //to add place id to each place in the list
              element['placeId'] = place.id;
              element['categoryId'] = category.id;
              favourites.add(element);
            }
          }
        });
      }
      emit(GetFavouritesSuccessState());
    }).catchError((onError) {
      emit(GetFavouritesErrorState());
    });
  }

  void removeFavourite({
    required int index,
  }) async {
    FirebaseFirestore.instance
        .collection('categories')
        .doc(favourites[index]['categoryId'])
        .collection('places')
        .doc(favourites[index]['placeId'])
        .update({"isItFav": false});
    favourites.removeAt(index);
    emit(RemoveFavouriteFromDB());
  }
}
