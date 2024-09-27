import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../theme/text_styles.dart';

class RatingWidget extends StatelessWidget {
  final double voteAverage;

  const RatingWidget(this.voteAverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.star.svg(),
        SizedBox(
          width: 4.w,
        ),
        Text(
          voteAverage.toString(),
          style: TextStyles.rating,
        )
      ],
    );
  }
}
