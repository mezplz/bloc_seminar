// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping_bloc/cart/bloc/cart_bloc.dart';
import 'package:shopping_bloc/home/bloc/plant_bloc.dart';
import 'package:shopping_bloc/home/bloc/plant_event.dart';
import 'package:shopping_bloc/home/service/plant_list_service.dart';

import 'cart/bloc/cart_event.dart';
import 'cart/service/cart_list_service.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PlantListRepository plantRepo = PlantListRepository();
    CartRepository cartRepo = CartRepository();
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: ((context) =>
                      PlantBloc(repo: plantRepo)..add(LoadPlantList())),
                ),
                BlocProvider(
                  create: ((context) =>
                      CartBloc(repo: cartRepo)..add(LoadCart())),
                ),
              ],
              child: GetMaterialApp(
                  title: 'Flutter UI',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    scaffoldBackgroundColor: Colors.white,
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                  ),
                  home: HomeScreen()),
            ));
  }
}
