// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_bloc/cart/bloc/cart_bloc.dart';
import 'package:shopping_bloc/config/pallete.dart';
import '../../cart/bloc/cart_event.dart';
import '../../cart/bloc/cart_state.dart';
import '../model/plant.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;
  const PlantTile({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(plant.img),
              ),
              Positioned(bottom: -1, right: -10, child: AddButton(plant: plant))
            ]),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            plant.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
          Text(
            plant.des,
            style: TextStyle(
                color: Palette.grey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '\$' + plant.price.toString(),
            style: TextStyle(
                color: Palette.theme,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final Plant plant;
  const AddButton({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), primary: Palette.theme),
              child: Icon(Icons.add_shopping_cart_outlined),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add to cart successfully')),
                );

                context.read<CartBloc>().add(CartItemAdded(plant));
              });
        } else {
          return Container();
        }
      },
    );
  }
}
