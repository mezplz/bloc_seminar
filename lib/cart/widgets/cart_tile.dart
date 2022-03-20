import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/pallete.dart';
import '../../home/model/plant.dart';

class CartTile extends StatelessWidget {
  final Plant plant;
  final onpress;
  const CartTile({Key? key, required this.plant, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            height: 90.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(plant.img),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plant.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                plant.des,
                style: TextStyle(
                    color: Palette.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$' + plant.price.toString(),
                style: TextStyle(
                    color: Palette.theme,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.w,
              ),
              TextButton(
                  onPressed: onpress,
                  style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Palette.red,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
