import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/layout_cubit/layout_cubit.dart';
import 'package:tourism/business_logic/layout_cubit/layout_states.dart';
import '../router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class CategoryPlaces extends StatefulWidget {
  const CategoryPlaces({Key? key}) : super(key: key);

  @override
  State<CategoryPlaces> createState() => _CategoryPlacesState();
}

class _CategoryPlacesState extends State<CategoryPlaces> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LayoutCubit();
      } ,
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<LayoutCubit, LayoutStates>(
                      builder: (context, state) {
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DefaultContainer(
                                isittrip: true,
                                item: {
                                  'name': LayoutCubit.get(context).trips[index]
                                      ['name'],
                                  "imageUrl": 'https://img.freepik.com/free-psd/travel-background-'
                                      'composition-with-lifeline_23-214960316'
                                      '0.jpg?w=1380&t=st=1667920454~exp=1667921054~hmac='
                                      'd4597babcd0bbb7c327ede40f832b7345c35bde4b287e55f9f30697933f1b27b'
                                },
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.place,
                                  );
                                },
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 25.h,
                              );
                            },
                            itemCount: LayoutCubit.get(context).trips.length);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
