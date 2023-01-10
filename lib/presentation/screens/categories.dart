import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/categories_cubit/categories_cubit.dart';
import 'package:tourism/business_logic/categories_cubit/categories_states.dart';
import '../router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Expanded(
            child: BlocConsumer<CategoriesCubit, CategoriesStates>(
              listener: (BuildContext context, Object? state) {},
              builder: (BuildContext context, state) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return DefaultContainer(
                      isittrip: false,
                      place: CategoriesCubit.get(context).categories[index],
                      onTap: () {
                        Navigator.pushNamed(context, Routes.categoryPlaces,
                            arguments: {
                              "categoryId": CategoriesCubit.get(context)
                                  .categories[index]['categoryId'],"name" :
                              CategoriesCubit.get(context)
                                  .categories[index]['name']
                            });
                      },
                      index: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 25.h,
                    );
                  },
                  itemCount: CategoriesCubit.get(context).categories.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
