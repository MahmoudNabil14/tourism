import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/layout_cubit/layout_cubit.dart';
import 'package:tourism/business_logic/layout_cubit/layout_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutCubit>(
      create: (context)=> LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xFFFCE44D),
              centerTitle: true,
              title:  Hero(
                tag: 'logo',
                child: Image(
                    width: 125.w,
                    height: 75.h,
                    image: const AssetImage('images/logo.png'),
                    fit: BoxFit.fill),
              ),
            ),
            // drawer: const MyDrawer(),
            body: LayoutCubit.get(context).screens[LayoutCubit.get(context).bottomNavCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,selectedItemColor: Colors.amber,
              backgroundColor: Colors.grey[100],
                currentIndex: LayoutCubit.get(context).bottomNavCurrentIndex,
                onTap: (int index) {
                  LayoutCubit.get(context).changeBottomNav(index: index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
                  BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
                ],
            ),
          );
        },
      ),
    );
  }
}
