import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_task/features/hotels/presentation/screens/all_hotels_screen.dart';
import 'package:hotels_task/features/hotels/presentation/widgets/rating_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotels_task/core/resources/color_manager.dart';
import 'package:hotels_task/core/resources/value_manger.dart';
import 'package:hotels_task/features/hotels/presentation/widgets/slider.dart';

import '../bloc/hotel_bloc.dart';
import '../widgets/star_card.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 650.h,
      child: BlocBuilder<HotelBloc, HotelsState>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Reset',                    style: Theme.of(context).textTheme.bodySmall,
),
                    ),
                    Text('Filters',                 style: Theme.of(context).textTheme.displayLarge,
),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close,
                        color:Colors.black
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PRICE PER NIGHT',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Container(
                    width: 55.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s4),
                        border: Border.all(color: ColorManager.grey)),
                    child: Center(
                      child: Text(
                        '\$'
                        '${BlocProvider.of<HotelBloc>(context).maxPrice}'
                        '+',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SliderWidget(),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'RATING',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 40.w,
                
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<HotelBloc>(context)
                                .getSelctedReviewScore(index);
                          },
                          child: RatingCard(
                              reviewScore: BlocProvider.of<HotelBloc>(context)
                                  .ratingList[index]['score'],
                              color: BlocProvider.of<HotelBloc>(context)
                                  .ratingList[index]['Color']),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 25.w,
                        ),
                    itemCount: 5),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'HOTEL CLASS',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StarCard()
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'DISTANCE FROM',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Divider(),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'City center',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.darkGrey,
                          size: 18.w,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<HotelBloc>(context).add(FilterHotelsEvent());
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HotelsScreen()));
                },
                child: Container(
                  width: 300.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 9, 34, 172)),
                  child: Center(
                    child: Text(
                      'Show results',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
