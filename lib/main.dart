import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/business_logic/categories_cubit/categories_cubit.dart';
import 'package:tourism/business_logic/places_cubit/places_cubit.dart';
import 'package:tourism/presentation/router/app_router.dart';
import 'package:tourism/presentation/styles/themes.dart';

import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) {
              return CategoriesCubit()..getCategories();
            }),
            BlocProvider(
              lazy: false,
                create: (context) {
              return PlacesCubit()..getAllPlaces();
            }),
          ],
          child: MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGeneratedRoute,
            initialRoute: Routes.initialRoute,
          ),
        );
      },
    );
  }
}
