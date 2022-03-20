// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_bloc/cart/cart.dart';
import 'package:shopping_bloc/config/pallete.dart';
import 'package:shopping_bloc/home/widgets/plant_tile.dart';

import 'bloc/plant_bloc.dart';
import 'bloc/plant_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'PLANT SHOP',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () => Get.to(() => CartScreen()),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
        ),
        body: BlocBuilder<PlantBloc, PlantState>(
          builder: ((context, state) {
            if (state is PlantLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PlantLoaded) {
              return GridView.count(
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      state.plant.length,
                      (index) => Center(
                            child: PlantTile(plant: state.plant[index]),
                          )));
            } else {
              return Container();
            }
          }),
        ));
  }
}
