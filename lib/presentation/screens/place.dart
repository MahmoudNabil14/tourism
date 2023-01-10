import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/place_details_cubit/place_details_cubit.dart';
import 'package:tourism/business_logic/place_details_cubit/place_details_states.dart';
import 'package:tourism/presentation/widgets/place_widgets/payer.dart';

class Place extends StatelessWidget {
  const Place(
      {Key? key,
      required this.placeId,
      required this.description,
      required this.name,
      required this.imageUrl,
      required this.images,
        required this.offers })
      : super(key: key);
  final String placeId;
  final String description;
  final String name;
  final String imageUrl;
  final List<dynamic> images;
  final List<dynamic> offers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Place_details_cubit(displayedimg: images[0]),
        child: BlocConsumer<Place_details_cubit, place_details_states>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(name),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(Place_details_cubit.get(context)
                          .displayedimg ),
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Place_details_cubit.get(context)
                                      .setDisplayed(image: images[index]);
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(images[index]),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  width: MediaQuery.of(context).size.width / 5,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 5.w,
                              );
                            },
                            itemCount: images.length),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' Description',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' Offered by',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      //MediaQuery.of(context).size.height / 2
                      height: 265,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(15),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return  Payer(offers: offers[index],tripName: name,);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemCount: offers.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
