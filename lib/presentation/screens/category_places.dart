import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/places_cubit/places_cubit.dart';
import 'package:tourism/business_logic/places_cubit/places_states.dart';
import '../router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class CategoryPlaces extends StatelessWidget {
  const CategoryPlaces({
    Key? key,
    required this.categoryID,
    required this.name
  }) : super(key: key);
  final String categoryID;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit()..getPlaces(categoryID: categoryID),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(name),),

        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<PlacesCubit, PlacesStates>(
                  builder: (context, state) {
                    return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DefaultContainer(
                            isittrip: true,
                            place: {
                              'name': PlacesCubit.get(context).places[index]
                                  ['name'],
                              "imageUrl": PlacesCubit.get(context).places[index]
                                  ['imageUrl'],
                              "isItFav": PlacesCubit.get(context).places[index]
                                  ['isItFav']
                            },
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.place,arguments: {
                                "placeId": PlacesCubit.get(context)
                                    .places[index]['placeId'],"name" :
                                PlacesCubit.get(context)
                                    .places[index]['name'],"description" :
                                PlacesCubit.get(context)
                                    .places[index]['description'],"imageUrl" :
                                PlacesCubit.get(context)
                                    .places[index]['imageUrl'],"images" :
                                PlacesCubit.get(context)
                                    .places[index]['images'],
                                "offers" :
                                PlacesCubit.get(context)
                                    .places[index]['offers'],
                              }
                              );
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
                        itemCount: PlacesCubit.get(context).places.length);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
