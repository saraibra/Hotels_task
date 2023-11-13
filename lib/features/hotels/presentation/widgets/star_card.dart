import 'package:flutter/material.dart';
import 'package:hotels_task/core/resources/color_manager.dart';
import 'package:hotels_task/core/resources/value_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/hotel_bloc.dart';

class StarCard extends StatelessWidget {
  StarCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:(){BlocProvider.of<HotelBloc>(context).getStarsNumber(1);},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(AppPadding.p2),
            ),
            child: Icon(
              Icons.star,
              color: ColorManager.orange,
              size: 12.w,
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap:(){BlocProvider.of<HotelBloc>(context).getStarsNumber(2);},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(AppPadding.p2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorManager.orange,
                  size: 12.w,
                ),
                Icon(
                  Icons.star,
                  color: ColorManager.orange,
                  size: 12.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap:(){BlocProvider.of<HotelBloc>(context).getStarsNumber(3);},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(AppPadding.p2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorManager.orange,
                  size: 12.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
       GestureDetector(
          onTap:(){BlocProvider.of<HotelBloc>(context).getStarsNumber(4);},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(AppPadding.p2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
       GestureDetector(
          onTap:(){BlocProvider.of<HotelBloc>(context).getStarsNumber(5);},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(AppPadding.p2),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                  ],
                ),
                Icon(
                  Icons.star,
                  color: ColorManager.orange,
                  size: 12.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.orange,
                      size: 12.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
