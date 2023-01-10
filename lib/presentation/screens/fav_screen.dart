import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/favourites_cubit/favourites_cubit.dart';
import 'package:tourism/business_logic/favourites_cubit/favourites_states.dart';
import 'package:tourism/business_logic/places_cubit/places_cubit.dart';
import 'package:tourism/business_logic/places_cubit/places_states.dart';
import 'package:tourism/presentation/router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){return FavouritesCubit()..getFavourites();},
      child: Scaffold(
        body: BlocBuilder<FavouritesCubit, FavouritesStates>(
          builder: (context, state) {
            return ConditionalBuilder(
                condition: FavouritesCubit.get(context).favourites.isNotEmpty,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BlocBuilder<PlacesCubit, PlacesStates>(
                                  builder: (context, state) => DefaultContainer(
                                    isittrip: true,
                                    place: {
                                      'name': FavouritesCubit.get(context)
                                          .favourites[index]['name'],
                                      "imageUrl": FavouritesCubit.get(context)
                                          .favourites[index]['imageUrl'],
                                      "isItFav": FavouritesCubit.get(context)
                                          .favourites[index]['isItFav']
                                    },
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.place,arguments: {
                                        "placeId": FavouritesCubit.get(context)
                                            .favourites[index]['placeId'],"name" :
                                        FavouritesCubit.get(context)
                                            .favourites[index]['name'],"description" :
                                        FavouritesCubit.get(context)
                                            .favourites[index]['description'],"imageUrl" :
                                        FavouritesCubit.get(context)
                                            .favourites[index]['imageUrl'],"images" :
                                        FavouritesCubit.get(context)
                                            .favourites[index]['images'],"offers" :
                                        FavouritesCubit.get(context)
                                            .favourites[index]['offers']
                                      }
                                      );
                                    },
                                    iconOnPressed: () {
                                      FavouritesCubit.get(context)
                                          .removeFavourite(index: index);
                                    },
                                    index: index,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 25.h,
                                );
                              },
                              itemCount: FavouritesCubit.get(context)
                                  .favourites
                                  .length),
                        ),
                      ],
                    ),
                  );
                },
                fallback: (context) {
                  if (state is GetFavouritesLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amberAccent,
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.favorite_border_outlined),
                          const Text(
                            'No Favourites yet',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            clipBehavior: Clip.hardEdge,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.homeLayout);
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.amberAccent),
                              elevation: const MaterialStatePropertyAll(20),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            child: const SizedBox(
                              width: 250,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Add To Favourite',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                });
          },
        ),
      ),
    );
  }
}
