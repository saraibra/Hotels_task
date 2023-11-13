import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/value_manger.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.reviewScore, required this.color});
  final String reviewScore;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppPadding.p2),
      ),
      child: Center(
          child: Text(
        reviewScore,
        style: Theme.of(context).textTheme.headlineLarge,
      )),
    );
  }
}
