import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/places_cubit/places_cubit.dart';
import 'package:tourism/business_logic/search_cubit/search_cubit.dart';
import 'package:tourism/business_logic/search_cubit/search_states.dart';
import '../router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit, SearchStates>(
          builder: (context, state) {
            List<Map<String, dynamic>> searchedPlaces = SearchCubit.get(context).searchedList;
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: "Search By Name",
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Colors.amber)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Colors.amber)),
                        prefixIcon: const Icon(Icons.search, color: Colors.amber),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                    maxLines: 1,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        SearchCubit.get(context).searchInListOfItems(searchedList: []);
                      } else {
                        List<Map<String, dynamic>> searchedPlaces = PlacesCubit.get(context).allPlaces.where((place) {
                          return place['name'].toString().toUpperCase().contains(searchController.text.toUpperCase());
                        }).toList();
                        SearchCubit.get(context).searchInListOfItems(searchedList: searchedPlaces);
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  if(searchedPlaces.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DefaultContainer(
                            isittrip: true,
                            place: {
                              'name': searchedPlaces[index]['name'],
                              "imageUrl": searchedPlaces[index]['imageUrl'],
                              "isItFav": searchedPlaces[index]['isItFav']
                            },
                            onTap: () {
                              Navigator.pushNamed(context, Routes.place, arguments: {
                                "placeId": searchedPlaces[index]['placeId'],
                                "name": searchedPlaces[index]['name'],
                                "description": searchedPlaces[index]['description'],
                                "imageUrl": searchedPlaces[index]['imageUrl'],
                                "images": searchedPlaces[index]['images'],
                                "offers": searchedPlaces[index]['offers'],
                              });
                            },
                            index: index,
                            iconOnPressed: () {
                              PlacesCubit.get(context).fav(index: index);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25.h,
                          );
                        },
                        itemCount: searchedPlaces.length),
                  )
                ],
              ),
            );
          },
        ));
  }
}
