import 'package:flutter/material.dart';
import 'package:hotels_task/core/resources/color_manager.dart';
import 'package:hotels_task/core/resources/value_manger.dart';
import 'package:hotels_task/features/hotels/domain/entities/hotel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s140)),
      width: double.infinity,
      height: 300.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                    imageUrl: hotel.image,
                    width: double.infinity,
                    height: 110.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: const SizedBox(),
                        )),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Hero(
                    tag: "",
                    transitionOnUserGestures: true,
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.favorite_border,
                        color: ColorManager.white,
                        size: 16.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: SizedBox(
                width: 150.w,
                height: 20.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: ColorManager.grey,
                                size: 8.w,
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 3.w),
                          itemCount: hotel.starts),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Hotel',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                hotel.name,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s14),
                        color: ColorManager.mediumGreen),
                    child: Center(
                      child: Text(
                        '${hotel.reviewScore}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    hotel.review,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.pin_drop,
                    color: ColorManager.grey,
                    size: 12.w,
                  ),
                  Text(
                    hotel.address,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.black),
                    borderRadius: BorderRadius.circular(AppSize.s4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Container(
                            width: 100.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s4),
                                color: ColorManager.primary.withOpacity(0.3)),
                            child: const Center(
                              child: Text('Our lowest price',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ),
                        ),
                        Text(
                            '\$'
                            '${hotel.price}',
                            style: TextStyle(
                                color: ColorManager.mediumGreen, fontSize: 20,
                                fontWeight: FontWeight.bold
                                )),
                        Text(
                          'Renaissance',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'View Deal',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.w,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  child: const Text(
                    'More prices',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
