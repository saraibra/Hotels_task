import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:hotels_task/features/hotels/presentation/bloc/hotel_bloc.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderState();
}

class _SliderState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: 20.0,
      max: 540.0,
      showTicks: true,
      showLabels: true,
      stepSize: 10,
      value: BlocProvider.of<HotelBloc>(context).maxPrice,
      onChanged: (value) {
        setState(() {
          BlocProvider.of<HotelBloc>(context).add(UpdatePricesEvent(value.toInt()));
        });
      },
    );
  }
}
