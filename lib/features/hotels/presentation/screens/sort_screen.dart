import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_task/features/hotels/presentation/screens/all_hotels_screen.dart';

import '../bloc/hotel_bloc.dart';

class SortScreen extends StatelessWidget {
  const SortScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 650.h,
      child: Column(
        children: [
          Card(
              elevation: 2,
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(child: Text('Sort by',  style: Theme.of(context).textTheme.displayLarge,
)),
              )),
          SizedBox(
            height: 500.h,
            child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                          BlocProvider.of<HotelBloc>(context).sortList[index]),
                      trailing:BlocProvider.of<HotelBloc>(context).selectedIndex==index? Icon(Icons.check,
                      color: Colors.blue,
                      ):SizedBox(),
                      onTap: () {
                        BlocProvider.of<HotelBloc>(context)
                            .add(SortHotelsEvent(index));
                              Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HotelsScreen()));
                      },
                    ),
                itemCount: 7),
          ),
        ],
      ),
    );
  }
}
