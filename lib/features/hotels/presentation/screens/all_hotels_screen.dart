import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_task/features/hotels/presentation/screens/filter_screen.dart';
import 'package:hotels_task/features/hotels/presentation/screens/sort_screen.dart';
import '../../../../core/resources/value_manger.dart';
import '../bloc/hotel_bloc.dart';
import '../widgets/hotel.dart';
import '../widgets/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextButton.icon(
              icon: Icon(Icons.filter_1),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((context) => FilterScreen()),
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white);
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context)=>FilterScreen())
                  // );
                },
                label: Text('Filter')),
            TextButton.icon(
              icon: Icon(Icons.sort),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((context) => SortScreen()),
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white);
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context)=>FilterScreen())
                  // );
                },
                label: Text('Sort'))
          ])),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: BlocBuilder<HotelBloc, HotelsState>(builder: (context, state) {
          if (state is LoadedFilteredHotelsState) {
            return ListView.separated(
                itemBuilder: (context, index) => HotelWidget(
                      hotel: state.allHotels[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount: state.allHotels.length);
          } else if (state is LoadedSortedHotelsState) {
            return ListView.separated(
                itemBuilder: (context, index) => HotelWidget(
                      hotel: state.allHotels[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount: state.allHotels.length);
          } else if (state is LoadingHotelsState) {
            return ListView.separated(
                itemBuilder: (context, index) => HotelWidget(
                      hotel:
                          BlocProvider.of<HotelBloc>(context).hotelsList[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount:
                    BlocProvider.of<HotelBloc>(context).hotelsList.length);
          } else if (state is LoadedHotelsState) {
            return ListView.separated(
                itemBuilder: (context, index) => HotelWidget(
                      hotel: state.allHotels[index],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                itemCount: state.allHotels.length);
          } else {
            return const LoadingIndicator();
          }
        }),
      ),
    );
  }
}
